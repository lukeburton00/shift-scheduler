require "test_helper"

class BusiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @busy = busies(:one)
  end

  test "should get index" do
    get busies_url
    assert_response :success
  end

  test "should get new" do
    get new_busy_url
    assert_response :success
  end

  test "should create busy" do
    assert_difference('Busy.count') do
      post busies_url, params: { busy: { employee_id: @busy.employee_id, end_time: @busy.end_time, start_time: @busy.start_time } }
    end

    assert_redirected_to busy_url(Busy.last)
  end

  test "should show busy" do
    get busy_url(@busy)
    assert_response :success
  end

  test "should get edit" do
    get edit_busy_url(@busy)
    assert_response :success
  end

  test "should update busy" do
    patch busy_url(@busy), params: { busy: { employee_id: @busy.employee_id, end_time: @busy.end_time, start_time: @busy.start_time } }
    assert_redirected_to busy_url(@busy)
  end

  test "should destroy busy" do
    assert_difference('Busy.count', -1) do
      delete busy_url(@busy)
    end

    assert_redirected_to busies_url
  end
end
