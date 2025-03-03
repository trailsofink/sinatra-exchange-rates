require "sinatra"
require "sinatra/reloader"
require "http"

exchange_api = ENV.fetch("EXCHANGE_API_KEY")
@currencies = HTTP.get("https://api.exchangerate.host/list?access_key=#{exchange_api}")

get("/") do
  puts @currencies.response.parse
  erb(:index)
end
