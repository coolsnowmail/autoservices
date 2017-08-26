class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authorize_moderator

  protected

    def authorize_moderator
      @current_moderator = Moderator.find_by(id: session[:moderator_id])
      unless @current_moderator
        redirect_to root_path, alert: 'Please, login'
      end
    end
end
