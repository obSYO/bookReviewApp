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
    if @book.save
      redirect_to root_path
    else
      redirect_to  new_book_path
    end
  end
  def show
    @post = Post.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to root_path
  end

  private
  def book_params
    params.require(:book).permit(:booktitle, :author, :bookimage)
  end

end
