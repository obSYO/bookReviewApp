class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def index
    @reviews = Review.all
  end

  def create
    @review = Review.create(review_params)
    redirect_to "/books/#{@review.book.id}"
  end

  def edit
    @review = Post.find(params[:id])
  end

  def update
    review = Post.find(params[:id])
    review.update(post_params)
    redirect_to  new_book_review_path(review.id)
  end

  def destroy
    review = Post.find(params[:id])
    review.destroy
    redirect_to root_path
  end


  private
  def review_params
    params.require(:review).permit(:title, :reviewText).merge(user_id: current_user.id, book_id: params[:book_id])
  end

end
