require "test_helper"

class LanguagesControllerTest < ActionDispatch::IntegrationTest
  test "should get local" do
    get languages_local_url
    assert_response :success
  end
end
