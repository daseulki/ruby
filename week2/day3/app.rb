require 'sinatra'
require 'sinatra/reloader'
require 'csv'
require 'date'

before do
  p "*********************************"
  p params
  p "*********************************"
end

get '/' do
  erb :index
end

get '/signin' do
  erb :signin
end

get '/idcomplete' do
  @id = params[:id]
  @pwd = params[:pwd]
  @pwdconfig = params[:pwdconfig]
  idconfig = true


  CSV.foreach('user.csv',encoding: 'utf-8') do |row|
    if row[0] == @id
      idconfig = false
      break
    else
      idconfig = true
    end
  end

  if idconfig == false
    redirect '/idfail'
  else
    erb :idcomplete
  end



  if @pwd == @pwdconfig
    CSV.open('user.csv','a+:utf-8') do |csv|
      csv << [@id,@pwd]
    end
  else
    redirect '/pwfail'
  end
  erb :idcomplete
end

get '/idfail' do
  erb :idfail
end

get '/pwfail' do
  erb :pwfail
end

get '/post' do
  erb :post
end

get '/complete' do
  @title = params[:title]
  @write = params[:write]
  @time = Time.now.to_s
  CSV.open('context.csv','a+:utf-8') do |csv|
    csv << [@title,@write,@time]
  end
  erb :complete
end

get '/show' do
  @context = []
  CSV.foreach('context.csv',encoding: 'utf-8') do |row|
    @context << row
  end
  erb :show
end
