require "rails_helper"


RSpec.describe AutoservicesController, :type => :controller do

  let!(:moderator) { create(:moderator) }
  let!(:autoservice) { create(:autoservice) }
  let!(:autoservice1) { create(:autoservice) }
  let!(:autoservice2) { create(:autoservice) }
  let!(:autoservice3) { create(:autoservice) }
  let!(:autoservice4) { create(:autoservice) }

  context 'for index' do

    it 'should render index' do
      get :index
      expect(response).to render_template(:index)
      expect(assigns(:autoservices)).to eq(Autoservice.paginate(:page => 1, :per_page => 5).order('updated_at DESC'))
    end

    it 'should redirect to moderator path' do
      session[:moderator_id] = moderator.id
      get :index
      expect(response).to redirect_to(moderator_path(moderator.id))
    end

    it 'should render index with search' do
      get :index, params: { search: autoservice.name }
      expect(response).to render_template(:index)
      expect(assigns(:autoservices).first).to eq(Autoservice.find_by(name: autoservice.name))
    end
  end

  context 'for show' do

    it 'should render show' do
      get :show, params: { id: autoservice.id }
      expect(assigns(:autoservice)).to eq(autoservice)
    end

  end

  context 'for destroy' do

    it 'should render partial autoservice delete' do
      session[:moderator_id] = moderator.id
      delete :destroy, params: { id: autoservice.id, format: :js }
      expect(assigns(:autoservice).destroyed?).to eq(true)
      expect(response).to render_template(partial: "_autoservice_delete")
    end
  end

  context 'should do create' do
    it 'should create autoservice' do
      session[:moderator_id] = moderator.id
      post :create, params: {autoservice: {name: 'name111', address: 'address111', phone: '111111111'}}
      expect(response).to redirect_to(moderator_path(moderator.id))
      expect(Autoservice.last.name).to eq('name111')
    end
  end

  context 'should do update' do
    it 'should uptade autoservice' do
      session[:moderator_id] = moderator.id
      post :update, params: {id: autoservice.id, autoservice: {name: 'name111', address: 'address111', phone: '111111111'}}
      expect(response).to redirect_to(moderator_path(moderator.id))
      expect(autoservice.reload.name).to eq('name111')
    end
  end
end