class ModeratorsController < ApplicationController
  def show
    @autoservices = Autoservice.all.order('updated_at DESC')
    @autoservice = Autoservice.new
  end
end
