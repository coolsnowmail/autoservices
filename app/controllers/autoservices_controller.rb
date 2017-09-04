class AutoservicesController < ApplicationController
  skip_before_action :authorize_moderator, only: [:index, :show, :create]
  before_action :set_autoservice, only: [:destroy, :update]
  def index
    return redirect_to moderator_path(session[:moderator_id]) if session[:moderator_id]
    @autoservices = Autoservice.all
  end

  def edit
    @autoservice = Autoservice.find_by(id: params[:id])
    render partial: "autoservice_edit"
  end

  def show
    @autoservice = Autoservice.find_by(id: params[:id])
  end

  def update
    @autoservice.update(autoservice_params)
    redirect_to moderator_path(session[:moderator_id])
  end

  def create
    # autoservice = Autoservice.find_by(id: params[:id])
    # @comment = autoservice.comments.build(mail: params[:email], text: params[:text])
    # @comment.save
    # UserMailer.new_comment_alerm(@comment).deliver
    # redirect_to autoservice_path(autoservice.id)
  end

  def destroy
    @autoservice.destroy
    render partial: "autoservice_delete"
  end

  private

    def set_autoservice
      @autoservice = Autoservice.find(params[:id])
    end

    def autoservice_params
      params.require(:autoservice).permit(:name, :address, :phone, :avatar)
    end
end
