# -*- coding: utf-8 -*-
require 'test_helper'

class SaidGoodPointsCreateTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:takami)
  end

  test "ログインし，いいところを+1する" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { name: @user.name, password: "takami" } }
    # logged in
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
    # いいところを+1
    post said_good_points_create_path, params: { from:1, to:3, good_point:3 }
    assert_redirect_to @user
    follow_redirect!
    # 数字がプラスされたかチェック
    # logout
    delete logout_path
    assert_not is_logged_in?
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path, count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
  end

end
