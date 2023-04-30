require "application_system_test_case"

class BloggersTest < ApplicationSystemTestCase
  setup do
    @blogger = bloggers(:one)
  end

  test "visiting the index" do
    visit bloggers_url
    assert_selector "h1", text: "Bloggers"
  end

  test "creating a Blogger" do
    visit bloggers_url
    click_on "New Blogger"

    fill_in "Bl title", with: @blogger.bl_title
    click_on "Create Blogger"

    assert_text "Blogger was successfully created"
    click_on "Back"
  end

  test "updating a Blogger" do
    visit bloggers_url
    click_on "Edit", match: :first

    fill_in "Bl title", with: @blogger.bl_title
    click_on "Update Blogger"

    assert_text "Blogger was successfully updated"
    click_on "Back"
  end

  test "destroying a Blogger" do
    visit bloggers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Blogger was successfully destroyed"
  end
end
