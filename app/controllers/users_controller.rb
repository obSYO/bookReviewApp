class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
    @reviews = @user.reviews
    @user_books = @user.books
  end

  private
  def user_params
    params.require(:user).permit(:id, :nickname, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
