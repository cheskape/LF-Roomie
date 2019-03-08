require "application_system_test_case"

class BasicInformationsTest < ApplicationSystemTestCase
  setup do
    @basic_information = basic_informations(:one)
  end

  test "visiting the index" do
    visit basic_informations_url
    assert_selector "h1", text: "Basic Informations"
  end

  test "creating a Basic information" do
    visit basic_informations_url
    click_on "New Basic Information"

    fill_in "Address", with: @basic_information.address
    fill_in "Birthday", with: @basic_information.birthday
    fill_in "Firstname", with: @basic_information.firstname
    fill_in "Lastname", with: @basic_information.lastname
    fill_in "Profile pic", with: @basic_information.profile_pic
    fill_in "Sex", with: @basic_information.sex
    fill_in "User", with: @basic_information.user_id
    click_on "Create Basic information"

    assert_text "Basic information was successfully created"
    click_on "Back"
  end

  test "updating a Basic information" do
    visit basic_informations_url
    click_on "Edit", match: :first

    fill_in "Address", with: @basic_information.address
    fill_in "Birthday", with: @basic_information.birthday
    fill_in "Firstname", with: @basic_information.firstname
    fill_in "Lastname", with: @basic_information.lastname
    fill_in "Profile pic", with: @basic_information.profile_pic
    fill_in "Sex", with: @basic_information.sex
    fill_in "User", with: @basic_information.user_id
    click_on "Update Basic information"

    assert_text "Basic information was successfully updated"
    click_on "Back"
  end

  test "destroying a Basic information" do
    visit basic_informations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Basic information was successfully destroyed"
  end
end
