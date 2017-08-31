class ModeratorsController < ApplicationController
  def show
    @autoservices = Autoservice.all
  end
end
