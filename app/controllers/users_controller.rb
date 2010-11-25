class UsersController < ApplicationController

  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update, :destroy]

  def new
    @roles=Role.find(:all,:order=>"name")
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      #flash[:notice] = "Account created!"
      #redirect_back_or_default account_url
      redirect_to dashboard_url
    else
      render :action => :new
    end
  end

  def show
    @user = @current_user
  end

  def edit
    @user = @current_user
    @roles=Role.find(:all,:order=>"name")
    @role=Role.find(@current_user.role_id)
  end

  def update
    @user = @current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to dashboard_url
    else
      render :action => :edit
    end
  end

  def destroy
    @user = @current_user
    @user.destroy
    
    flash[:notice] = "Account deleted!"
    redirect_to '/'
  end
  
end