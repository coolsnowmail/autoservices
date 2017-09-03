class CommentsController < ApplicationController
  def index
    @autoservice = Autoservice.find_by(id: params[:id])
  end
end
