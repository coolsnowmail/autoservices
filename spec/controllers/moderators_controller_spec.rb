require "rails_helper"


RSpec.describe ModeratorsController, :type => :controller do

  # let!(:autoservice) { create(:autoservice) }
  # let!(:autoservice1) { create(:autoservice) }

  context 'should do user' do
    # it 'should redirect to admin' do
    #   user.tasks << task
    #   user.tasks << task1
    #   user.update(role: 'admin')
    #   session[:user_id] = user.id
    #   get :show_user
    #   expect(response).to redirect_to(users_show_admin_path(session[:user_id]))
    #   expect(assigns(:current_user)).to eq(user)
    # end

    it 'should redirect to root' do
      get :show
      expect(response).to redirect_to(root_path)
    end

    # it 'should show admin' do
    #   user.tasks << task
    #   user.tasks << task1
    #   user.update(role: 'admin')
    #   session[:user_id] = user.id
    #   get :show_admin
    #   expect(assigns(:current_user)).to eq(user)
    #   expect(assigns(:tasks)).to eq(Task.all)
    # end
  end
end