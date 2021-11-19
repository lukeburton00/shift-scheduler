require "application_system_test_case"

class BusytimesTest < ApplicationSystemTestCase
  setup do
    @busytime = busytimes(:one)
  end

  test "visiting the index" do
    visit busytimes_url
    assert_selector "h1", text: "Busytimes"
  end

  test "creating a Busytime" do
    visit busytimes_url
    click_on "New Busytime"

    click_on "Create Busytime"

    assert_text "Busytime was successfully created"
    click_on "Back"
  end

  test "updating a Busytime" do
    visit busytimes_url
    click_on "Edit", match: :first

    click_on "Update Busytime"

    assert_text "Busytime was successfully updated"
    click_on "Back"
  end

  test "destroying a Busytime" do
    visit busytimes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Busytime was successfully destroyed"
  end
end
