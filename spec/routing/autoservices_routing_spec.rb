require 'rails_helper'

RSpec.describe AutoservicesController, type: :routing do
  describe 'routing' do

    it 'routes to #root' do
      expect(get: '/').to route_to('autoservices#index')
    end

    it 'routes to #show' do
      expect(get: '/autoservices/1').to route_to('autoservices#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/autoservices/1/edit').to route_to('autoservices#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/autoservices').to route_to('autoservices#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/autoservices/1').to route_to('autoservices#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/autoservices/1').to route_to('autoservices#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/autoservices/1').to route_to('autoservices#destroy', id: '1')
    end
  end
end