require 'rubygems'
require 'will_paginate'
class UserStatusController < ApplicationController
  layout 'dashboard'
  before_filter :require_user
  def index
    @status_flag=false
    if current_user.role.name == 'Admin' || current_user.role.name == 'Manager' || current_user.role.name == 'PM'
      if params[:flag] and params[:flag]==true and params[:id] and params[:id]!=''
        @status_flag=true
        @statuses=Status.find(:all,:conditions=>["project_id=? and task_date=?",params[:id],Time.now.strftime("%Y-%m-%d")])
      else
        @statuses=Status.find(:all,:conditions=>["task_date=?",Time.now.strftime("%Y-%m-%d")])
      end
    else
      @statuses=Status.find_all_by_user_id_and_task_date(current_user.id,Time.now.strftime("%Y-%m-%d"))
    end
    flash[:notice]='No record found' if @statuses.blank?
  end
  
  def task
    @project=Project.find(params[:id])
    @status=Status.find_by_user_id_and_project_id_and_task_date(current_user.id,@project.id,Time.now.strftime("%Y-%m-%d"))
    if @status.blank?
      @status=Status.new 
    else
      @status=@status
    end
  end
  def update
    begin
      @status = Status.find_by_user_id_and_project_id_and_task_date(current_user.id,params[:id],Time.now.strftime("%m-%d-%Y"))
      if !@status.blank?
        if @status.update_attributes(:user_id=>current_user.id,:project_id=>params[:id],:task=>params[:status][:task],:task_date=>Date.today)
          flash[:notice] = "Successfully updated status."
          redirect_to :action=>"index"
        end
        render :action => 'task', :id=>params[:id]
      else
         @status = Status.new
         if @status.update_attributes(:user_id=>current_user.id,:project_id=>params[:id],:task=>params[:status][:task],:task_date=>Date.today)
          flash[:notice] = "Successfully created status."
          redirect_to :action=>"index"
         else
          render :action => 'task', :id=>params[:id]
         end
     end
   
    rescue Exception => e
    end
  end
end
