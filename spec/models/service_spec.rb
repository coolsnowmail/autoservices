require "rails_helper"

RSpec.describe Service, :type => :model do

  describe 'validations' do
    it { should belong_to(:autoservice) }
  end
end