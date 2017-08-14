class UsersController < ApplicationController
  before_action :fetch_user, only: %i(show)
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show; end

  private

  def fetch_user
    #if user_signed_in?
    @user = User.find(params[:id])
    #else redirect_to new_user_session_path
  end
end
