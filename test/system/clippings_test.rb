require "application_system_test_case"

class ClippingsTest < ApplicationSystemTestCase
  setup do
    @clipping = clippings(:one)
  end

  test "visiting the index" do
    visit clippings_url
    assert_selector "h1", text: "Clippings"
  end

  test "creating a Clipping" do
    visit clippings_url
    click_on "New Clipping"

    fill_in "Cli title", with: @clipping.cli_title
    click_on "Create Clipping"

    assert_text "Clipping was successfully created"
    click_on "Back"
  end

  test "updating a Clipping" do
    visit clippings_url
    click_on "Edit", match: :first

    fill_in "Cli title", with: @clipping.cli_title
    click_on "Update Clipping"

    assert_text "Clipping was successfully updated"
    click_on "Back"
  end

  test "destroying a Clipping" do
    visit clippings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Clipping was successfully destroyed"
  end
end
