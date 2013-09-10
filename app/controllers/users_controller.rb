class UsersController < ApplicationController

  before_action :find_user, only: %w(edit update show destroy)

  def index
    @users = User.all
  end

  def show

  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new user_params

    if @user.save
      flash.notice = "Congratulations! A new account has been created"
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update user_params
      flash.notice = "User has been updated"
      redirect_to user_url(@user)
    else
      render "edit"
    end
  end

 def destroy
  @user.destroy

  redirect_to users_path
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone)
  end

end
