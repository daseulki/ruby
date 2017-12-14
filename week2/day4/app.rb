require 'sinatra'
require 'sinatra/reloader'
require 'data_mapper'

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/blog.db")

class Post
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :content, Text
  property :created_at, DateTime
end

class User
  include DataMapper::Resource
  property :id, Serial
  property :email, String
  property :pwd, Text
  property :created_at, DateTime
end

# Perform basic sanity checks and initialize all relationships
# Call this when you've defined all your models
DataMapper.finalize

# automatically create the post table
Post.auto_upgrade!
User.auto_upgrade!

#가상환경에서 활용을 하고 있기 때문에 ip binding 해야함
set :bind, '0.0.0.0'

before do
  p "************************************"
  p params
  p "************************************"
end

get '/' do
  @post = Post.all.reverse
  erb :index

end

get '/users' do
  @users = User.all
  erb :users
end

get '/signup' do
  erb :signup
end

get '/idcomplete' do
  @email = params[:email]
  @pwd = params[:pwd]
  User.create(email: @email, pwd: @pwd)
  erb :idcomplete
end

get '/post' do
  erb :post

end

get '/complete' do
  @title = params[:title]
  @content = params[:content]
  Post.create(title: @title, content: @content)
  erb :complete
end
