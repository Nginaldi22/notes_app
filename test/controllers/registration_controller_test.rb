require "test_helper"

class RegistrationControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get registration_new_url
    assert_response :success
  end

  test "should get signup" do
    get registration_signup_url
    assert_response :success
  end
end
