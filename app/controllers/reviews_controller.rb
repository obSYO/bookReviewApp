class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def new
  end

  def index
    @reviews = Review.all
  end

  def create
    @review = Review.create(review_params)
    if @review.save
      redirect_to "/books/#{@review.book.id}"
    else
      redirect_to "/books/#{@review.book.id}", flash: {notice: 'レビューの保存に失敗しました'}
    end
  end

  def edit
    @review = Review.find_by(id: params[:id])
  end

  def update
    @review = Review.find_by(id: params[:id])
    @review.update(review_params)
    if @review.save
      redirect_to root_path
    else
      redirect_to action: 'edit'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.user_id == current_user.id
      @review.destroy
      redirect_to root_path
    else
      redirect_to "/books/#{review.book_id}"
    end
  end


  private
  def review_params
    params.require(:review).permit(:title, :reviewText).merge(user_id: current_user.id, book_id: params[:book_id])
  end

  def book_params
    params.require(:book).permit(:booktitle, :author, :bookimage).merge(user_id: current_user.id)
  end

end
