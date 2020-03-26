class PostsController < ApplicationController
  def index
    @posts = Post.all
    @posts = User.find(session[:postID]).posts
  end

  def new
    @post = Post.new
  end

  def show
  end

  def create
    #store data
    @post = User.find(session[:postID]).posts.create(post_params)
    if @post.persisted? 
      redirect_to :posts
    else
      render :new
    end

  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    
    redirect_to action: :index
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    
    redirect_to :posts
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
