class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def create
    @post = Post.create(post_params)
    redirect_to "/books/#{post.book.id}"
  end

  def edit
    @post = Post.find(params[:id])
  end

  private
  def post_params
    params.require(:post).permit(:title, :reviewText).merge(user_id: current_user.id, book_id: params[:book_id])
  end

end
