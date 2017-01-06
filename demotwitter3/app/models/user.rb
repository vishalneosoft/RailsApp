class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :avatar, AvatarUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook]
  validates :username, presence: true, uniqueness: true
  has_many :posts, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship",foreign_key: "follower_id",
  dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",foreign_key: "followed_id",
  dependent: :destroy

  has_many :following,through: :active_relationships,source: :followed
  has_many :followers,through: :passive_relationships,source: :follower

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
      user.username = auth.info.name
      user.image = auth.info.image
        # assuming the user model has a name
        # assuming the user model has an image
      
    # If you are using confirmable and the provider(s) you use validate emails, 
    # uncomment the line below to skip the confirmation emails.
    # user.skip_confirmation!
    end
  end

  def follow(other)
  	active_relationships.create(followed_id: other.id)
  end

  def unfollow(other)
  	active_relationships.find_by(followed_id: other.id).destroy
  end

  def following?(other)
  	following.include?(other)
  end

end
