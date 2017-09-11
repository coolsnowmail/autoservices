class SearchController < ApplicationController
  skip_before_action :authorize_moderator, only: [:autoservice_search]
  def autoservice_search
    render json: Search.terms_for(params[:term])
  end
end
