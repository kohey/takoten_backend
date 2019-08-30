# ユーザログイン→位置情報の周りのmsgを取得
# msgの位置情報→サーバたてっぱ
# msgのpost→dbに保存
require 'open-uri'
require 'json'
require 'net/http'

# res = Net::HTTP.get_response(params)
# json = JSON.parse(res.body)

# p json

# puts "hello"

File.open("db.json") do |file|
  #保存されてるmessageの取得
  message_hash = JSON.load(file)
  messages = Net::HTTP.get(URI.parse('http://localhost:3000/Messages'))
  res = JSON.parse(messages)
  p res[1]
end