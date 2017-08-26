class SessionsController < ApplicationController
  skip_before_action :authorize_moderator

  def new
    # redirect_to users_show_user_path(session[:user_id]) if session[:user_id]
  end

  def create
    moderator = Moderator.find_by(email: params[:email])
    if moderator && moderator.authenticate(params[:password])
      session[:moderator_id] = moderator.id
      return redirect_to moderator_path(session[:moderator_id])
    else
      redirect_to login_url, alert: 'Wrong login or password'
    end
  end

  def destroy
    session[:moderator_id] = nil
    redirect_to root_path
  end
end