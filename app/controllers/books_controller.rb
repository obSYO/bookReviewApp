class BooksController < ApplicationController

  def index
    @books = Book.all
    @posts = Post.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(book_params)
    redirect_to root_path
  end

  def show
    @post = Post.new
    @posts = @book.posts.includes(:user)
  end

  private
  def book_params
    params.require(:book).permit(:booktitle, :author, :bookimage)
  end

end
