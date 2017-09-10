class SearchController < ApplicationController
  skip_before_action :authorize_moderator, only: [:autoservice_search]
  def autoservice_search
    puts params[:search]
    i = Service.where("name LIKE ?", "%#{params[:search]}%")
    i = Service.where("name LIKE ?", "%#{params[:search]}%")
    puts i
    puts 111111111111111
  end
end
