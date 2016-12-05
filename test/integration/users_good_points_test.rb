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
    assert_select "ul#good_points > li#good_point-1", /話しが上手い/
  end

  # no HTTP_REFERERの問題で
  # test ":katamiにいいところを追加する" do
  #   get login_path
  #   assert_template 'sessions/new'
  #   post login_path, params: { session: { name: @user.name, password: "takami" } }
  #   # login
  #   assert is_logged_in?
  #   assert_redirected_to @user
  #   follow_redirect!

    
  #   # TODO said_good_points_createでも，no HTTP_REFERERの問題
  #   # @request.env['HTTP_REFERER'] = user_path(@user) # HTTP_REFERERを設定したい
  #   # post said_good_points_create_path, params: { from:1, to:1, good_point:2 } # ここでエラー
  #   # assert_redirect_to @user 
  #   # follow_redirect!
  #   # 数字がプラスされ，ボタンが消えたかチェック
  #   # assert_select "ul#good_points > li#good_point-1 > div#good_point_count", 2
    
  # end
end
