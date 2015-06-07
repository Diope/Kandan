class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash.now[:success] = "Welcome to Kandan"
      redirect_to root_path
    end
  end

  def show
    @user = User.find(params(:id))
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def user_params
      params.require(:user).permit(:name, :username, :password, :password_confirmation)
    end


end
