class AutoservicesController < ApplicationController
  skip_before_action :authorize_moderator, only: [:index, :show, :create]
  def index
    return redirect_to moderator_path(session[:moderator_id]) if session[:moderator_id]
    @autoservices = Autoservice.all
  end

  def show
    @autoservice = Autoservice.find_by(id: params[:id])
  end

  def create
    autoservice = Autoservice.find_by(id: params[:id])
    @comment = autoservice.comments.build(mail: params[:email], text: params[:text])
    @comment.save
    UserMailer.new_comment_alerm(@comment).deliver
    redirect_to autoservice_path(autoservice.id)
  end
end
