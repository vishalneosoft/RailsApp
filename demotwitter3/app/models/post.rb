class Post < ActiveRecord::Base
  # associations
	has_many :messages, dependent: :destroy
	belongs_to :user
  has_many :retweets, class_name: "Post",foreign_key: "retweet_id",dependent: :destroy
  has_many :comments, dependent: :destroy
  # attributes
  
  # validations
  validates :content,presence: true,length: { maximum: 140 }
  
  # scopes
  default_scope  { order(:created_at => :desc) }
  
  # callbacks
  #before_destroy :reset_retweet_id
  mount_uploader :avatar, AvatarUploader

  # methods
  # def reset_retweet_id
  #   self.retweets.update_all(retweet_id: :nil)
  # end
end
