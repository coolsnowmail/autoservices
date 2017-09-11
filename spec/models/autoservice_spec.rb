require "rails_helper"

RSpec.describe Autoservice, :type => :model do

  describe 'validations' do
    it { should have_many(:services).dependent(:destroy) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should accept_nested_attributes_for(:services) }
  end
end