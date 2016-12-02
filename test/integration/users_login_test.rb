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
    assert_select "a[href=?]", user_path(@user)
    # logout
    delete logout_path
    assert_not is_logged_in?
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path, count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
  end

  test "ログインし，ユーザー一覧を表示，最後にログアウト" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { name: @user.name, password: "takami" } }
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
    assert_select "a[href=?]", index_path
    # ユーザー一覧が表示されているか確認
    get index_path
    assert_template 'users/index'
    # logout
    delete logout_path
    assert_not is_logged_in?
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path, count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
  end

  test "ログインしていなかったらユーザーページが見られないようにする" do
    get user_path(@user)
    follow_redirect!
    assert_template login_path
  end
end
