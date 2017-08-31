class Autoservice < ApplicationRecord
  has_many :services, dependent: :destroy
  has_many :comments, dependent: :destroy
end
