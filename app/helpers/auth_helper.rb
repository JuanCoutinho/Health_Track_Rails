module AuthHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end  
  
  def signed_in?
    !!current_user 
  end

  def authenticate_user!
    unless signed_in?
      redirect_to signin_path
    end
  end

  def redirect_if_already_signed_in
    redirect_to root_path if signed_in?
  end
end
