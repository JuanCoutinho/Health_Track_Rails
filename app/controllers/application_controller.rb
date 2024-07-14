class ApplicationController < ActionController::Base
  include AuthHelper
  helper_method :redirect_if_already_signed_in, :current_user, :signed_in, :authenticate_user
end
