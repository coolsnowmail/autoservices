class SearchController < ApplicationController
  skip_before_action :authorize_moderator, only: [:autoservice_search]
  def autoservice_search
    puts params[:search]

  end
end
