require "test_helper"

class BusytimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @busytime = busytimes(:one)
  end

  test "should get index" do
    get busytimes_url
    assert_response :success
  end

  test "should get new" do
    get new_busytime_url
    assert_response :success
  end

  test "should create busytime" do
    assert_difference('Busytime.count') do
      post busytimes_url, params: { busytime: {  } }
    end

    assert_redirected_to busytime_url(Busytime.last)
  end

  test "should show busytime" do
    get busytime_url(@busytime)
    assert_response :success
  end

  test "should get edit" do
    get edit_busytime_url(@busytime)
    assert_response :success
  end

  test "should update busytime" do
    patch busytime_url(@busytime), params: { busytime: {  } }
    assert_redirected_to busytime_url(@busytime)
  end

  test "should destroy busytime" do
    assert_difference('Busytime.count', -1) do
      delete busytime_url(@busytime)
    end

    assert_redirected_to busytimes_url
  end
end
