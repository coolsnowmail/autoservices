class Comment < ApplicationRecord
  belongs_to :autoservice
  validates :text, presence: true
  validates :mail, presence: true
end
