
require 'open-uri'
require 'json'
require 'net/http'

messages =  []

File.open("db.json") do |file|
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
