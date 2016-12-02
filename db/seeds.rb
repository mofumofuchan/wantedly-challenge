# -*- coding: utf-8 -*-
require 'ffaker'
require 'faker'

# usersテーブルを作成
100.times do
  password = FFaker::Internet.password
  User.create(name: Faker::Pokemon.name.downcase,
              password: password, password_confirmation: password)
end

# good_pointsテーブルを作成
20.times do
  GoodPoint.create(name: FFaker::Color.name)
end

# said_good_pointsテーブルを作成
10000.times do |i| 
  puts "i = #{i}" if i % 100 == 0
  begin
    SaidGoodPoint.create(from_id: rand(100)+1, to_id: rand(100)+1,
                         good_point_id: rand(20)+1)
  rescue
    puts "error: maybe duplication"
  end
end
