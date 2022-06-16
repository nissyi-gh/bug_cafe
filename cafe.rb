# frozen_string_literal: true
require 'debug'

DRINKS = [
  { name: 'コーヒー', price: 300 },
  { name: 'カフェラテ', price: 400 },
  { name: 'チャイ', price: 460 },
  { name: 'エスプレッソ', price: 340 },
  { name: '緑茶', price: 450 }
].freeze

FOODS = [
  { name: 'チーズケーキ', price: 470 },
  { name: 'アップルパイ', price: 520 },
  { name: 'ホットサンド', price: 410 }
].freeze

def take_order(menus)
  menus.each.with_index(1) do |menu, i|
    puts "(#{i})#{menu[:name]}: #{menu[:price]}円"
  end
  order_number = gets_order_number(menus.size)
  puts "#{menus[order_number][:name]}(#{menus[order_number][:price]}円)ですね。"
  order_number
end

def gets_order_number(order_index_max)
  order_number = 0
  valid_order_numbers = (1..order_index_max).to_a

  until valid_order_numbers.include?(order_number)
    puts "1から#{order_index_max}のいずれかの数値を入力してください。"
    print '>'
    order_number = gets.to_i
  end

  # 配列のindexとメニュー番号のずれをマイナスする
  order_number - 1
end

puts 'bugカフェへようこそ！ご注文は？ 番号でどうぞ'
drink_order = take_order(DRINKS)

puts 'フードメニューはいかがですか?'
food_order = take_order(FOODS)

total = DRINKS[drink_order][:price] + FOODS[food_order][:price]
puts "お会計は#{total}円になります。ありがとうございました！"
