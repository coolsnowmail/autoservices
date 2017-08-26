class AutoservicesController < ApplicationController
  skip_before_action :authorize_moderator, only: [:index]
  def index
    return redirect_to moderator_path(session[:moderator_id]) if session[:moderator_id]
  end
end
