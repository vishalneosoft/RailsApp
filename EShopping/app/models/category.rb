class Category < ActiveRecord::Base
  has_many :brand_categories
  has_many :brands,through: :brand_categories
  has_many :sub_categories, class_name: "Category", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Category"
end
