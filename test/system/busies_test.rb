require "application_system_test_case"

class BusiesTest < ApplicationSystemTestCase
  setup do
    @busy = busies(:one)
  end

  test "visiting the index" do
    visit busies_url
    assert_selector "h1", text: "Busies"
  end

  test "creating a Busy" do
    visit busies_url
    click_on "New Busy"

    fill_in "Employee", with: @busy.employee_id
    fill_in "End time", with: @busy.end_time
    fill_in "Start time", with: @busy.start_time
    click_on "Create Busy"

    assert_text "Busy was successfully created"
    click_on "Back"
  end

  test "updating a Busy" do
    visit busies_url
    click_on "Edit", match: :first

    fill_in "Employee", with: @busy.employee_id
    fill_in "End time", with: @busy.end_time
    fill_in "Start time", with: @busy.start_time
    click_on "Update Busy"

    assert_text "Busy was successfully updated"
    click_on "Back"
  end

  test "destroying a Busy" do
    visit busies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Busy was successfully destroyed"
  end
end
