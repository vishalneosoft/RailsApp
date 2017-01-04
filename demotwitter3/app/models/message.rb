class Message < ActiveRecord::Base
	belongs_to :post
	validates :content,presence: true,length: { maximum: 140 }
	default_scope  { order(:created_at => :desc) }
end
