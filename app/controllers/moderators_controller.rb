class ModeratorsController < ApplicationController
  def show
    @autoservices = Autoservice.paginate(:page => params[:page], :per_page => 10).order('updated_at DESC')
    @autoservice = Autoservice.new
  end
end
