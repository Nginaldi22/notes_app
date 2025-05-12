require "test_helper"

class SubjectControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get subject_new_url
    assert_response :success
  end

  test "should get create" do
    get subject_create_url
    assert_response :success
  end

  test "should get show" do
    get subject_show_url
    assert_response :success
  end
end
