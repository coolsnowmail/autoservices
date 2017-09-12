require "rails_helper"


RSpec.describe SessionsController, :type => :controller do

  let!(:moderator) { create(:moderator) }
  # let!(:moderator1) { create(:moderator) }
  context 'session new' do
    it 'should redirect_to moderator_path' do
      session[:moderator_id] = moderator.id
      get :new
      expect(response).to redirect_to(moderator_path(moderator.id))
    end
  end

  context 'moderator login create' do
    it 'should redirect_to login_url' do
      get :create
      expect(response).to redirect_to(login_url)
      expect(flash[:alert]).to eq('Wrong login or password')
    end

    it 'should redirect_to moderator' do
      get :create, params: { email: moderator.email, password: moderator.password }
      expect(response).to redirect_to(moderator_path(moderator.id))
    end
  end

  context 'moderator login destroy' do
    it 'should redirect_to root_path' do
      session[:moderator_id] = moderator.id
      get :destroy
      expect(response).to redirect_to(root_url)
      expect(session[:moderator_id]).to eq(nil)
    end
  end
end