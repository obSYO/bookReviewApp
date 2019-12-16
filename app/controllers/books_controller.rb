class BooksController < ApplicationController

  def index
    render "books/index"
    @books = Book.all
    @posts = Post.all
  end

  def new
    @book = Book.new
  end

  def create
    Book.create(book_params)
    redirect_to root_path
  end

  private
  def book_params
    params.require(:book).permit(:booktitle, :author, :bookimage)
  end

end
