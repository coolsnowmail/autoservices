class SearchController < ApplicationController
  skip_before_action :authorize_moderator, only: [:autoservice_search]
  def autoservice_search
    # search_names = Service.all.pluck(:name).uniq + Autoservice.all.pluck(:name)
    # puts search_names
    render json: Search.terms_for(params[:term])
  end
end
