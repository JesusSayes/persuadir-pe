# coding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery

#   helper_method :current_user, :logged_in?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

end
