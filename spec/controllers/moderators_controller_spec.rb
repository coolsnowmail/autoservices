require "rails_helper"


RSpec.describe ModeratorsController, :type => :controller do

  let!(:moderator) { create(:moderator) }
  let!(:autoservice) { create(:autoservice) }
  let!(:autoservice1) { create(:autoservice) }

  context 'should do user' do

    it 'should redirect to root' do
      get :show, params: { id: moderator.id }
      expect(response).to redirect_to(root_path)
    end

    it 'should render show' do
      session[:moderator_id] = moderator.id
      get :show, params: { id: moderator.id }
      assert_template :show
      expect(assigns(:current_moderator)).to eq(moderator)
      expect(assigns(:autoservices)).to eq(Autoservice.paginate(:page => 1, :per_page => 10).order('updated_at DESC'))
      expect(assigns(:autoservice)).to be_a_new(Autoservice)
    end
  end
end