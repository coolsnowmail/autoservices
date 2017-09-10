class Autoservice < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  has_many :services, dependent: :destroy
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :services, allow_destroy: true, reject_if: proc { |attributes| attributes['name'].blank? }
  pg_search_scope :search_autoservice, against: [:name, :address, :phone]
end
