require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get ligin_form" do
    get user_ligin_form_url
    assert_response :success
  end

end
