# coding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery

#   helper_method :current_user, :logged_in?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def ancestry_options(items, &block)
    return ancestry_options(items){ |i| "#{'-' * i.depth} #{i.name}" } unless block_given?
    result = []
    items.map do |item, sub_items|
      result << [yield(item), item.id]
      #this is a recursive call:
      result += ancestry_options(sub_items, &block)
    end
    result
  end

end
