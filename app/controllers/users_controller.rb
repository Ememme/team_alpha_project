class UsersController < ApplicationController
  before_action :fetch_user, only: %i(show edit update destroy)

  def index
    @users = User.all
  end

  def new; end

  def create; end

  def show
    @books_borrowed = Book.all #where(borrower_id=current_user.id) - to rethink
    @books_to_lend = Book.all #where books belong to current_user - to rethink
  end

  def edit; end

  def destroy; end

  private

  def fetch_user
    @user = User.find(params[:id])
  end

end
