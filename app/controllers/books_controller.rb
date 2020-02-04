class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @books = Book.all.order("created_at DESC").page(params[:page]).per(3)
    @review = Review.all
    @reviews = @review.includes(:book)
    @user_reviews = current_user.reviews.order("created_at DESC") if current_user.present?
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
      redirect_to new_book_path, flash: {notice: '本の保存に失敗しました'}
    end
  end
  
  def show
    @book = Book.find(params[:id])
    @review = Review.new
    @reviews = @book.reviews.includes(:book)
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user_id == current_user.id
      @book = Book.find(params[:id])
    else
      redirect_to action: 'show'
    end
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    if book.save
      redirect_to book_path(book.id)
    else
      redirect_to action: 'update'
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.user_id == current_user.id
      book.destroy
      redirect_to root_path
    else
      redirect_to action: 'show'
    end
  end

  def search
    @search_books = Book.search(params[:keyword]).order("created_at DESC").page(params[:page]).per(3)
    if @search_books.present?
      @reviews = Review.all
      @search_reviews = @reviews.search(params[:keyword])
    else
      @nosuch_books = "一致する本は登録されていません"
    end
    respond_to do |format|
      format.html
      format.json
    end
  end


  private

  def book_params
    params.require(:book).permit(:booktitle, :author, :bookimage).merge(user_id: current_user.id)
  end

  def review_params
    params.require(:review).permit(:title, :reviewText).merge(user_id: current_user.id, book_id: params[:book_id])
  end


end
