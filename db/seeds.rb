# -*- coding: utf-8 -*-
require 'ffaker'

# usersテーブルを作成
100.times do
  password = FFaker::Internet.password
  User.create(name: FFaker::Name.first_name.downcase,
              password: password, password_confirmation: password)
end

# good_pointsテーブルを作成
sample_good_points =
  ["優しい", "頼りがいがある", "かわいい", "思慮深い", "賢い",
   "信頼できる", "話しやすい", "面白い", "ほんわかする", "情熱的",
   "冷静", "努力家", "頭が切れる", "忍耐強い", "行動力がある",
   "サービス精神旺盛", "ヴィジョンがある", "天才的", "オーラがすごい", "悪魔的"]

sample_good_points.each do |point| 
  GoodPoint.create(name: point)
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
