class HomeController < ApplicationController



  def index
    @posts = Post.all
  end

  def post

  end

  def result
    @post = Post.find(params[:id])

  end

  def create
    #Post.create ( :username => params[:username],
    #              :title => params[:title],
    #              :context => params[:content] )

    post = Post.new
    post.username = params[:username]
    post.title = params[:title]
    post.content = params[:content]

    post.save

    redirect_to '/'

  end

  def destroy

    Post.find(params[:id]).destroy
    redirect_to '/'
  end

  def modify
    @post = Post.find(params[:id])

  end

  def update
    @id = params[:id]
    @post = Post.find(params[:id])
    @post.update(username: params[:username], title: params[:title], content: params[:content])
    @post.save

    redirect_to "/"
  end
end
