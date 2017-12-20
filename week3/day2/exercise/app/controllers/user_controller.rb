class UserController < ApplicationController
  def index
    @post = Post.all
  end

  def new
  end

  def create
      post = Post.new
      post.username = params[:username]
      post.title = params[:title]
      post.content = params[:content]
      post.save
      redirect_to '/'

  end

  def show
    @post = Post.find(params[:id])
  end

  def update

    @post = Post.find(params[:id]).update
    @post.save

    redirect_to '/'
  end

  def edit

  end

  def destroy
      Post.find(params[:id]).destroy
      redirect_to '/'
  end



end
