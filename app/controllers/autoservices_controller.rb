class AutoservicesController < ApplicationController
  require 'will_paginate/collection'
  protect_from_forgery :except => :show
  skip_before_action :authorize_moderator, only: [:index, :show, :create]
  before_action :set_autoservice, only: [:destroy, :update]
  def index
    return redirect_to moderator_path(session[:moderator_id]) if session[:moderator_id]
    if params.has_key?(:search)
      autoservices_by_search = Autoservice.search_autoservice(params[:search])
      services = Service.where("name LIKE ?", "%#{params[:search]}%")
      autoservices_ids = services.pluck(:autoservice_id).uniq
      autoservices_form_services = Autoservice.find(autoservices_ids)
      @autoservices = (autoservices_by_search + autoservices_form_services).uniq
      @autoservices = @autoservices.paginate(:page => params[:page], :per_page => 5)
    else
      @autoservices = Autoservice.paginate(:page => params[:page], :per_page => 5).order('updated_at DESC')
    end
  end

  def edit
    @autoservice = Autoservice.find_by(id: params[:id])
  end

  def show
    @autoservice = Autoservice.find_by(id: params[:id])
    render partial: "alert_f" if flash[:alert]
  end

  def update
    @autoservice.update(autoservice_params)
    redirect_to moderator_path(session[:moderator_id])
  end

  def create
    @autoservice = Autoservice.create(autoservice_params)
    redirect_to moderator_path(session[:moderator_id])
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
      params.require(:autoservice).permit(:name, :address, :phone, :avatar, services_attributes: Service.attribute_names.map(&:to_sym).push(:_destroy))
    end
end
