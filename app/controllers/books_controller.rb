class BooksController < ApplicationController

  def index
    @books = Book.all.order("created_at DESC").page(params[:page]).per(3)
    @reviews = Review.all.order("created_at DESC")
  end

  def new
    @book = Book.new
    render  :_new
  end

  def create
    @book = Book.create(book_params)
    if @book.save
      redirect_to root_path
    else
      redirect_to new_book_path
    end
  end
  
  def show
    @book = Book.find(params[:id])
    @review = Review.new
    @reviews = @book.reviews.includes(:user)
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
    params.require(:book).permit(:booktitle, :author, :bookimage).merge(user_id: current_user.id)
  end

end
