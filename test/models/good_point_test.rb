# -*- coding: utf-8 -*-
require 'test_helper'

class GoodPointTest < ActiveSupport::TestCase
  def setup
    @good_point = GoodPoint.new(name: "ムードメーカー")
  end

  test "サンプルデータがvalidでないといけない" do
    assert @good_point.valid?
  end

  test "nameは空ではいけない" do
    @good_point.name = nil
    assert_not @good_point.valid?
  end
end
