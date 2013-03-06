# coding: utf-8
class HomeController < ApplicationController
  def index
    @notices_home = Notice.published.limit(3)
  end
end
