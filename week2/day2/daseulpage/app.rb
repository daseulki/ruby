require 'sinatra'
require 'sinatra/reloader'

require 'nokogiri'
require 'httparty'
require 'URI'

get '/' do
  erb :index

end

get '/melon' do

  url = "http://www.melon.com/search/trend/index.htm"
  response = HTTParty.get(url)
  doc = Nokogiri::HTML(response)
  @first = doc.css("#conts > div.realtime_keywd > ol > li.rank01 > div.realtime_rank > div > a")
  @second = doc.css("#conts > div.realtime_keywd > ol > li.rank02 > div.realtime_rank > div > a")
  @third = doc.css("#conts > div.realtime_keywd > ol > li.rank03 > div.realtime_rank > div > a")

  erb :melon
end

get '/melonresult' do
  @qwert = params[:qwert]
  url = "http://www.melon.com/search/total/index.htm?q=#{@qwert}"
  url = URI.encode(url)
  response = HTTParty.get(url)
  doc = Nokogiri::HTML(response)
  img = doc.css("a.wrap_thumb > img")[0]
  @img_url = img.attr('src')

  erb :melonresult
end
