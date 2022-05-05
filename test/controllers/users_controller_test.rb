require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get my_market" do
    get users_my_market_url
    assert_response :success
  end
end
