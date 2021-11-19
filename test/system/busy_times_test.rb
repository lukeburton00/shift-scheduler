require "application_system_test_case"

class BusyTimesTest < ApplicationSystemTestCase
  setup do
    @busy_time = busy_times(:one)
  end

  test "visiting the index" do
    visit busy_times_url
    assert_selector "h1", text: "Busy Times"
  end

  test "creating a Busy time" do
    visit busy_times_url
    click_on "New Busy Time"

    fill_in "Employee", with: @busy_time.employee_id
    fill_in "End time", with: @busy_time.end_time
    fill_in "Start time", with: @busy_time.start_time
    click_on "Create Busy time"

    assert_text "Busy time was successfully created"
    click_on "Back"
  end

  test "updating a Busy time" do
    visit busy_times_url
    click_on "Edit", match: :first

    fill_in "Employee", with: @busy_time.employee_id
    fill_in "End time", with: @busy_time.end_time
    fill_in "Start time", with: @busy_time.start_time
    click_on "Update Busy time"

    assert_text "Busy time was successfully updated"
    click_on "Back"
  end

  test "destroying a Busy time" do
    visit busy_times_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Busy time was successfully destroyed"
  end
end
