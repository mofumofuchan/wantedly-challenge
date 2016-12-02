# -*- coding: utf-8 -*-
require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:takami)
  end

  test "無効なデータでログインできないようにする" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { name: "", password: "" } }
    assert_template 'sessions/new'
  end

  test "ログインし，logoutボタンの表示を確認，最後にログアウトする" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { name: @user.name, password: "takami" } }

    # logged in
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", logout_path

    # logout
    delete logout_path
    assert_not is_logged_in?
    
  end

  
end
