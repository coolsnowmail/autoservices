class Autoservice < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  has_many :services, dependent: :destroy
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :services, allow_destroy: true, reject_if: proc { |attributes| attributes['name'].blank? }
end
