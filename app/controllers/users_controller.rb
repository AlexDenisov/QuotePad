class UsersController < ApplicationController
  load_and_authorize_resource

  before_filter :load_roles, :only => [:new, :edit, :update, :create]

  def index
    @legend_title = t :users
    @users = User.page(params[:page])
  end

  def show
    @legend_title = @user.display_name
    @excerpts = @user.excerpts.page(params[:page])
  end

  def new
    @allow_blank_role = true
    @legend_title = t :new_user
  end

  def create
    @user = User.new params[:user]
    if @user.save
      redirect_to users_path
    else
      @legend_title = t :new_user
      render 'new'
    end
  end

  def edit
    @legend_title = t :edit_user
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete :password
    end
    if @user.update_attributes params[:user]
      sign_in(@user, :bypass => true) if current_user == @user
      redirect_to user_path(@user)
    else
      @allow_blank_role = false
      @legend_title = t :edit_user
      render 'edit'
    end
  end

  private

  def find_resource
    @user ||= User.find params[:id]
  end

  def load_roles
    @roles = Role.all
  end
end
