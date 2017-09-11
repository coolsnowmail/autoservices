class CommentsController < ApplicationController
  skip_before_action :authorize_moderator, only: [:create]
  def index
    @autoservice = Autoservice.find_by(id: params[:id])
  end

  def create
    autoservice = Autoservice.find_by(id: params[:id])
    @comment = autoservice.comments.build(mail: params[:email], text: params[:text])
    if @comment.save
      redirect_to autoservice_path(autoservice.id), turbolinks: true
    else
      redirect_to autoservice_path(autoservice.id), alert: "Invalid email or password", turbolinks: true
    end
  end
end
