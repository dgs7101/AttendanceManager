require "test_helper"

class Admins::DashboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_dashboards_index_url
    assert_response :success
  end
end
