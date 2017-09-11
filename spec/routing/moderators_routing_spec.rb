require 'rails_helper'

RSpec.describe ModeratorsController, type: :routing do
  describe 'routing' do

    it 'routes to #show' do
      expect(get: '/moderators/1').to route_to('moderators#show', id: '1')
    end

  end
end