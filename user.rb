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
messages =  []

File.open("db.json") do |file|
  #保存されてるmessageの取得
  message_hash = JSON.load(file)
  users = Net::HTTP.get(URI.parse('http://localhost:3000/Users'))
  res = JSON.parse(users)
  test_user1 = res[2]

  message_hash["Messages"].each do |message|
    if (test_user1["Longitude"].to_i - message["Longitude"].to_i).abs < 2 && (test_user1["Latitude"].to_i - message["Latitude"].to_i).abs < 2
      messages.push(message)
    end
  end

end

p messages
