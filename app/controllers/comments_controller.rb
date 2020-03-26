class CommentsController < ApplicationController
  def index
    @comment = Comment.all
    @comments = Post.find(params[:format]).comments
  end

  def new
    @comment = Comment.new
    session[:postID] = params[:format]
  end

  def show
  end

  def create
    @comment = Post.find(session[:postID]).comments.create(comment_params)
    if @comment.persisted? 
      redirect_to action: :index, controller: :posts
    else
      render :new
    end
  end

  def update
  end

  def edit
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to action: :index, controller: :posts 
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
