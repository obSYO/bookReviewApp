class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def new
    @review = Review.new
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
    @review = Review.find(params[:id])
    if @review.user_id == current_user.id
    else
      redirect_to "/books/#{@review.book_id}"
    end
  end

  def update
    review = Review.find(params[:id])
    review.update(post_params)
    if review.save
      redirect_to  new_book_review_path(review.id)
    else
      redirect_to action: 'update'
    end
  end

  def destroy
    review = Review.find(params[review.id])
    if review.user_id == current_user.id
      review.destroy
      redirect_to root_path
    else
      redirect_to "/books/#{review.book_id}"
    end
  end


  private
  def review_params
    params.require(:review).permit(:title, :reviewText).merge(user_id: current_user.id, book_id: params[:book_id])
  end

end
