class AutoservicesController < ApplicationController
  skip_before_action :authorize_moderator, only: [:index, :show, :create]
  before_action :set_autoservice, only: [:destroy]
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

  def destroy
    @autoservice.destroy
    render partial: "autoservice_delete"
  end

  private

    def set_autoservice
      @autoservice = Autoservice.find(params[:id])
    end

    # def autoservice_params
    #   params.require(:bot).permit(:description, :login_vk, :password_vk, :access_token)
    # end
end
