class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = current_user
  end

  def new
    @user = User.new
  end

  def show;end

  def edit; end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to signin_path
    else
      render :new
    end
  end
 
  def update
    if @user.update(user_params)
      redirect_to user_url(@user)
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  def info; end

  private

  def set_user
    @user = current_user
    redirect_to users_url, alert: "Usuário não encontrado." unless @user
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :height, :weight, :pas, :pad)
  end
end
