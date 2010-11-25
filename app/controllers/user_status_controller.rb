class UserStatusController < ApplicationController
  layout 'dashboard'
  def index
    if  current_user.role.name.to_s == 'Admin' || 'Manager' || 'PM'
      @statuses=Status.all
    else
      @statuses=Status.find_all_by_user_id(current_user.id)
    end
  end
  def task
    @project=Project.find(params[:id])
    @status=Status.find_by_user_id_and_project_id(current_user.id,@project.id)
    if @status.blank?
      @status=Status.new 
    else
      @status=@status
    end
  end
  def update
    @status = Status.find_by_user_id_and_project_id(current_user.id,params[:id])
    if !@status.blank?
      if @status.update_attributes(:user_id=>current_user.id,:project_id=>params[:id],:task=>params[:status][:task])
        flash[:notice] = "Successfully updated status."
        redirect_to :action=>"index"
      else
        render :action => 'task'
      end
    else
       @status = Status.new
       if @status.update_attributes(:user_id=>current_user.id,:project_id=>params[:id],:task=>params[:status][:task])
        flash[:notice] = "Successfully created status."
        redirect_to :action=>"index"
       else
        render :action => 'task'
       end
    end
  end
end
