class Service < ApplicationRecord
  belongs_to :autoservice, optional: true
end
