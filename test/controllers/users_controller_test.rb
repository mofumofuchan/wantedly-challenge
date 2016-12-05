# -*- coding: utf-8 -*-
require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "Userの新規作成画面へ遷移する" do
    get signup_path
    assert_response :success
  end

  test "一覧表示はログインしていないと見られない" do
    get users_path
    assert_redirected_to login_url
  end

end
