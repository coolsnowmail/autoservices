require 'test_helper'

class SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get autoservice_search" do
    get search_autoservice_search_url
    assert_response :success
  end

end
