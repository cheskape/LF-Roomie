require 'test_helper'

class BasicInformationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @basic_information = basic_informations(:one)
  end

  test "should get index" do
    get basic_informations_url
    assert_response :success
  end

  test "should get new" do
    get new_basic_information_url
    assert_response :success
  end

  test "should create basic_information" do
    assert_difference('BasicInformation.count') do
      post basic_informations_url, params: { basic_information: { address: @basic_information.address, birthday: @basic_information.birthday, firstname: @basic_information.firstname, lastname: @basic_information.lastname, profile_pic: @basic_information.profile_pic, sex: @basic_information.sex, user_id: @basic_information.user_id } }
    end

    assert_redirected_to basic_information_url(BasicInformation.last)
  end

  test "should show basic_information" do
    get basic_information_url(@basic_information)
    assert_response :success
  end

  test "should get edit" do
    get edit_basic_information_url(@basic_information)
    assert_response :success
  end

  test "should update basic_information" do
    patch basic_information_url(@basic_information), params: { basic_information: { address: @basic_information.address, birthday: @basic_information.birthday, firstname: @basic_information.firstname, lastname: @basic_information.lastname, profile_pic: @basic_information.profile_pic, sex: @basic_information.sex, user_id: @basic_information.user_id } }
    assert_redirected_to basic_information_url(@basic_information)
  end

  test "should destroy basic_information" do
    assert_difference('BasicInformation.count', -1) do
      delete basic_information_url(@basic_information)
    end

    assert_redirected_to basic_informations_url
  end
end
