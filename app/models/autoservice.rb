class Autoservice < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  has_many :services, dependent: :destroy
  has_many :comments, dependent: :destroy
end
