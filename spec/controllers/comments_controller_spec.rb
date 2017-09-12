require "rails_helper"


RSpec.describe CommentsController, :type => :controller do

  let!(:moderator) { create(:moderator) }
  let!(:autoservice) { create(:autoservice) }
  # let!(:comment) { create(:comment) }

  context 'should do comments index' do

    it 'should redirect to root' do
      get :index
      expect(response).to redirect_to(root_path)
    end

    it 'should render index' do
      session[:moderator_id] = moderator.id
      get :index, params: { id: autoservice.id }
      assert_template :index
      expect(assigns(:current_moderator)).to eq(moderator)
      expect(assigns(:autoservice)).to eq(autoservice)
    end
  end

  context 'should do comments create' do

    it 'should rendirect to autoservice_path if comment valid' do
      post :create, params: { email: 'example@mail.com', text: 'blah blah blah', id: autoservice.id}
      expect(response).to redirect_to(autoservice_path(autoservice.id))
      expect(Comment.last.text).to eq('blah blah blah')
    end
  end
end