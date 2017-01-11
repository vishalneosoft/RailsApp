class Banner < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
end
