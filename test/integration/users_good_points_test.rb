# -*- coding: utf-8 -*-
require 'test_helper'

# ユーザのいいところが正しく表示されるかテスト
class UsersGoodPointsTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:takami)
  end
  
  test ":takamiのいいところが表示されるかテスト" do
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
    # プロフィールページでいいところが表示されるかチェック
    assert_select "li", "元気である"
    assert_select "li", "話が上手い"
  end
  
end
