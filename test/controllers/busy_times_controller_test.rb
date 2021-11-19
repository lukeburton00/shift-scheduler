require "test_helper"

class BusyTimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @busy_time = busy_times(:one)
  end

  test "should get index" do
    get busy_times_url
    assert_response :success
  end

  test "should get new" do
    get new_busy_time_url
    assert_response :success
  end

  test "should create busy_time" do
    assert_difference('BusyTime.count') do
      post busy_times_url, params: { busy_time: { employee_id: @busy_time.employee_id, end_time: @busy_time.end_time, start_time: @busy_time.start_time } }
    end

    assert_redirected_to busy_time_url(BusyTime.last)
  end

  test "should show busy_time" do
    get busy_time_url(@busy_time)
    assert_response :success
  end

  test "should get edit" do
    get edit_busy_time_url(@busy_time)
    assert_response :success
  end

  test "should update busy_time" do
    patch busy_time_url(@busy_time), params: { busy_time: { employee_id: @busy_time.employee_id, end_time: @busy_time.end_time, start_time: @busy_time.start_time } }
    assert_redirected_to busy_time_url(@busy_time)
  end

  test "should destroy busy_time" do
    assert_difference('BusyTime.count', -1) do
      delete busy_time_url(@busy_time)
    end

    assert_redirected_to busy_times_url
  end
end
