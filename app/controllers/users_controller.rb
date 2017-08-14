class UsersController < ApplicationController
  before_action :fetch_user, only: %i(show)

  def index
    @users = User.all
  end

  def show; end

  private

  def fetch_user
    @user = User.find(params[:id])
  end
end
