# -*- coding: utf-8 -*-
require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "rootでhomeが表示され，リンクの設定が正しいか，レイアウトのチェック" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", signup_path
  end
  
end
