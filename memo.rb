require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています

if memo_type == 1
  puts "拡張子を除いたファイル名を入力して下さい"
  file_name = gets
  puts "メモしたい内容を記入して下さい"
  puts "完了したらCtrl + D を押します"
  memo = STDIN.read
  CSV.open("#{file_name}.csv","w") do |csv|
    csv.puts ["#{memo}"]
  end
elsif memo_type == 2
  puts "編集するファイル名を拡張子を除いて入力して下さい"
  file_name = gets
  puts "追記する内容を記入して下さい"
  puts "完了したらCtrl + D を押します"
  memo = STDIN.read
  CSV.open("#{file_name}.csv","a") do |csv|
    csv.puts ["#{memo}"]
  end
end