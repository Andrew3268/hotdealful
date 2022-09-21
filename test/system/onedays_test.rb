require "application_system_test_case"

class OnedaysTest < ApplicationSystemTestCase
  setup do
    @oneday = onedays(:one)
  end

  test "visiting the index" do
    visit onedays_url
    assert_selector "h1", text: "Onedays"
  end

  test "creating a Oneday" do
    visit onedays_url
    click_on "New Oneday"

    fill_in "O title", with: @oneday.o_title
    click_on "Create Oneday"

    assert_text "Oneday was successfully created"
    click_on "Back"
  end

  test "updating a Oneday" do
    visit onedays_url
    click_on "Edit", match: :first

    fill_in "O title", with: @oneday.o_title
    click_on "Update Oneday"

    assert_text "Oneday was successfully updated"
    click_on "Back"
  end

  test "destroying a Oneday" do
    visit onedays_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Oneday was successfully destroyed"
  end
end
