class ModeratorsController < ApplicationController
  def show
    @autoservices = Autoservice.all
    @autoservice = Autoservice.new
  end
end
