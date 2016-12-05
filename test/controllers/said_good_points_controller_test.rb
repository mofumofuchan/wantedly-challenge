# -*- coding: utf-8 -*-
require 'test_helper'

class SaidGoodPointsControllerTest < ActionDispatch::IntegrationTest
  test "ログインせずいいところを+1しようとするとredirect" do
    post said_good_points_create_url
    assert_response :redirect
  end

end
