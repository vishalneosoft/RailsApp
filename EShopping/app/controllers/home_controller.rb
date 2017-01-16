class HomeController < ApplicationController
  def index
    @banners = Banner.all
    @categories = Category.all.where(parent_id: nil)
    @category = Category.find(1)
    @subcategories = @category.sub_categories
  end
end
