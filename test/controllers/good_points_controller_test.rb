require 'test_helper'

class GoodPointsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get good_points_create_url
    assert_response :success
  end

  test "should get index" do
    get good_points_index_url
    assert_response :success
  end

end
