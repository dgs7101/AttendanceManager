require "test_helper"

class AdminsControllerTest < ActionDispatch::IntegrationTest
  test "should get attendance" do
    get admins_attendance_url
    assert_response :success
  end

  test "should get reports" do
    get admins_reports_url
    assert_response :success
  end

  test "should get staff_managements" do
    get admins_staff_managements_url
    assert_response :success
  end

  test "should get vacations" do
    get admins_vacations_url
    assert_response :success
  end
end
