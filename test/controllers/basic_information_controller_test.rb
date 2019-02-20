require 'test_helper'

class BasicInformationControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get basic_information_show_url
    assert_response :success
  end

  test "should get edit" do
    get basic_information_edit_url
    assert_response :success
  end

end
