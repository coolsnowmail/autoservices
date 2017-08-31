class Autoservice < ApplicationRecord
  has_many :services
  has_many :comments
end
