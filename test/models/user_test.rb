# -*- coding: utf-8 -*-
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name:"inouesan", password:"inouesan",  password_confirmation:"inouesan")
  end

  test "サンプルの@userがvalidでなくてはならない" do
    assert @user.valid?
  end

  test "nameは存在していないとならない" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "nameの長さは50文字以下でないとならない" do
    @user.name = "a"*51
    assert_not @user.valid?
  end

  test "nameは一意でないとならない" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "passwordは空白ではダメ" do
    @user.password = @user.password_confirmation = " "*6
    assert_not @user.valid?
  end

  test "passwordは最低6文字ないとダメ" do
    @user.password = @user.password_confirmation = "abcde"
    assert_not @user.valid?
  end

  test "User:takamiが指摘したGoodPointは2つ" do
    takami = users(:takami)
    assert_equal 2, takami.finding_good_points.count
  end

  test "User:kjが指摘したGoodPointは1つ" do
    kj = users(:kj)
    assert_equal 1, kj.finding_good_points.count   
  end
  
  test "User:takamiが指摘されたGoodPointは2つ" do
    takami = users(:takami)
    assert_equal 2, takami.found_good_points.count
  end

  test "User:kjが指摘されたGoodPointは1つ" do
    kj = users(:kj)
    assert_equal 0, kj.found_good_points.count
  end
end
