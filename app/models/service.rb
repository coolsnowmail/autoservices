class Service < ApplicationRecord
  belongs_to :autoservice, optional: true
  pg_search_scope :search_service, against: [:name]
end
