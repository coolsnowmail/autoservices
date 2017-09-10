require 'rails_helper'

RSpec.describe SessionsController, type: :routing do
  describe 'routing' do


    it 'routes to #login#new' do
      expect(get: '/login').to route_to('sessions#new')
    end

    it 'routes to #admin#create' do
      expect(post: '/login').to route_to('sessions#create')
    end

    it 'routes to #login#destroy' do
      expect(delete: '/logout').to route_to('sessions#destroy')
    end
  end
end