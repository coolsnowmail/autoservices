require "rails_helper"

RSpec.describe Comment, :type => :model do

  describe 'validations' do
    it { should validate_presence_of(:mail) }
    it { should validate_presence_of(:text) }
    it { should belong_to(:autoservice) }
  end
end