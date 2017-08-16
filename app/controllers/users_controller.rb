class UsersController < ApplicationController
  before_action :fetch_user, only: %i(show)
  before_action :authenticate_user!

  def index
    @users = User.all
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end

  def show
    @book = Book.where(id: :book_id)
  end

  private

  def fetch_user
    #if user_signed_in?
    @user = User.find(params[:id])
    #else redirect_to new_user_session_path
  end

  def upvote
    @link = Link.find(params[:id])
    @link.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @link = Link.find(params[:id])
    @link.downvote_by current_user
    redirect_to :back
  end
end
