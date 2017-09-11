require 'rails_helper'

RSpec.describe SessionsController, type: :routing do
  describe 'routing' do


    it 'routes to #comments#index' do
      expect(get: '/login').to route_to('sessions#new')
    end

    it 'routes to #comments#create' do
      expect(post: '/login').to route_to('sessions#create')
    end

  end
end