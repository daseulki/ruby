require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get post" do
    get :post
    assert_response :success
  end

end
