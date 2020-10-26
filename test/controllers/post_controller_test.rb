require 'test_helper'

class PostControllerTest < ActionDispatch::IntegrationTest
  test "should get user" do
    get post_user_url
    assert_response :success
  end

end
