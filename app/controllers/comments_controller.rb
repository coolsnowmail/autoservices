class CommentsController < ApplicationController
  skip_before_action :authorize_moderator, only: [:create]
  def index
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
