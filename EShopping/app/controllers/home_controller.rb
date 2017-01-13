class HomeController < ApplicationController
  def index
    @banners = Banner.all
    @categories = Category.all
  end
end
