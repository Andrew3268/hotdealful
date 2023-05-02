require "application_system_test_case"

class HotdealsTest < ApplicationSystemTestCase
  setup do
    @hotdeal = hotdeals(:one)
  end

  test "visiting the index" do
    visit hotdeals_url
    assert_selector "h1", text: "Hotdeals"
  end

  test "creating a Hotdeal" do
    visit hotdeals_url
    click_on "New Hotdeal"

    fill_in "Deal title", with: @hotdeal.deal_title
    click_on "Create Hotdeal"

    assert_text "Hotdeal was successfully created"
    click_on "Back"
  end

  test "updating a Hotdeal" do
    visit hotdeals_url
    click_on "Edit", match: :first

    fill_in "Deal title", with: @hotdeal.deal_title
    click_on "Update Hotdeal"

    assert_text "Hotdeal was successfully updated"
    click_on "Back"
  end

  test "destroying a Hotdeal" do
    visit hotdeals_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Hotdeal was successfully destroyed"
  end
end
