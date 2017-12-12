require 'sinatra'
require 'sinatra/reloader'
require "csv"
require 'date'

#for crawling
require 'nokogiri'
require 'httparty'
require "uri"


get '/vote' do
  erb :vote
end

get '/result' do
  @count = params[:count]
  erb :result
end

get'/' do
  erb :index
end

get'/welcome/:name' do
  @name = params[:name]
  @time = Time.now.to_s
  CSV.open('user.csv', 'a+') do |csv|
    csv << [@name.to_s, @time]
  end
  erb :welcome
end

get '/users' do
  @users =[]
  CSV.foreach('user.csv') do |row|
    @users << row
  end
  erb :users

end

get '/lolfinder' do

  erb :lolfinder

end

get '/lol' do
  @username = params[:username]
  url = "http://www.op.gg/summoner/userName=#{@username}"
  url = URI.encode(url) #한글 url을 인코딩 하겠다
  response = HTTParty.get(url) #요청 보내기
  doc = Nokogiri::HTML(response) #노코기리로 컴터 읽기 편하게 만들어준다
  @win = doc.css("#SummonerLayoutContent > div.tabItem.Content.SummonerLayoutContent.summonerLayout-summary > div.SideContent > div.TierBox.Box > div.SummonerRatingMedium > div.TierRankInfo > div.TierInfo > span.WinLose > span.wins")
  @lose = doc.css("#SummonerLayoutContent > div.tabItem.Content.SummonerLayoutContent.summonerLayout-summary > div.SideContent > div.TierBox.Box > div.SummonerRatingMedium > div.TierRankInfo > div.TierInfo > span.WinLose > span.losses")

  erb :lol
end
