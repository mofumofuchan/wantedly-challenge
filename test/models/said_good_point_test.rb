# -*- coding: utf-8 -*-
require 'test_helper'

class SaidGoodPointTest < ActiveSupport::TestCase
  def setup
    @said_good_point = SaidGoodPoint.new(from_id: users(:takami).id,
                                         to_id: users(:kj).id,
                                         good_point_id: good_points(:one).id)
  end

  test "サンプルデータがvalidでなくてはならない" do
    assert @said_good_point.valid?
  end

  test "from_idは空ではいけない" do
    @said_good_point.from_id = nil
    assert_not @said_good_point.valid?
  end

  test "to_idは空ではいけない" do
    @said_good_point.to_id = nil
    assert_not @said_good_point.valid?
  end

  test "good_point_idは空ではいけない" do
    @said_good_point.good_point_id = nil
    assert_not @said_good_point.valid?
  end

  # test "User#finding_good_pointsでgood_pointsが取得できる" do
  #   @user = users(:takami)
  #   assert_not @user.finding_good_points.nil?
  # end
end
