# -*- coding: utf-8 -*-
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "mofumofu")
  end

  test "validでなくてはならない" do
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
end
