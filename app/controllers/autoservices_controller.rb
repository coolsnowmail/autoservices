class AutoservicesController < ApplicationController
  skip_before_action :authorize_moderator, only: [:index, :show]
  def index
    return redirect_to moderator_path(session[:moderator_id]) if session[:moderator_id]
    @autoservices = Autoservice.all
  end

  def show
    @autoservice = Autoservice.find_by(id: params[:id])
  end
end
