class SessionsController < ApplicationController
  before_action :redirect_if_already_signed_in, only: [:new, :create]

  def new 
    @user = User.new
  end

  def create 
    @user = User.find_by(email: user_params[:email])

    if @user && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to show_path
    else
      @user = User.new(email: user_params[:email])
      flash.now[:alert] = "Email ou senha inválidos"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
  
  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
