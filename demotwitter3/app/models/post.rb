class Post < ActiveRecord::Base
	has_many :messages, dependent: :destroy
	belongs_to :user
	validates :content,presence: true,length: { maximum: 140 }
	default_scope  { order(:created_at => :desc) }
  has_many :retweets, class_name: "Post",foreign_key: "retweet_id",dependent: :destroy
  has_many :comments, dependent: :destroy
end
