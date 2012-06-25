class UsersController < ApplicationController
  load_and_authorize_resource
  before_filter :find_resource, :only => [:update, 
                                          :edit, 
                                          :show]
  def index
    @legend_title = t :users
    @users = User.page(params[:page])
  end

  def show
    authorize! :show, @user
    @legend_title = @user.display_name
    @excerpts = @user.excerpts.page(params[:page])
  end

  def new
    @allow_blank_role = true
    @legend_title = t :new_user
    @roles = Role.all
  end

  def create
    @user = User.new params[:user]
    if @user.save
      redirect_to users_path
    else
      @legend_title = t :new_user
      @roles = Role.all
      render new_user_path @user
    end
  end

  def edit
    @legend_title = t :edit_user
    @roles = Role.all
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete :password
    end
    if @user.update_attributes params[:user]
      sign_in(@user, :bypass => true)
      redirect_to user_path(@user)
    else
      @allow_blank_role = false
      @legend_title = t :edit_user
      @roles = Role.all
      render edit_user_path @user
    end
  end

  def find_resource
    @user ||= User.find params[:id]
  end
end
