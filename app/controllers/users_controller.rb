class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end

  def show
    @book = Book.where(id: :book_id)
    @user = User.find(params[:id])
  end

  private

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
