require 'test_helper'

class OauthControllerTest < ActionController::TestCase
  test "should get callback" do
    get :callback
    assert_response :success
  end

end
