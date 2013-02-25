class HomeController < ApplicationController
  def index
    @notices = Notice.published
  end
end
