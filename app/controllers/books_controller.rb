class BooksController < ApplicationController
  before_action :set_book, only: %i[show destroy]
  before_action :authenticate_user!, except: [:index]

  def index
    @books = Book.all
    @q = Book.ransack(params[:q])
    @books = @q.result(distinct: true)

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id

    if @book.save
      redirect_to user_book_path(current_user,@book), notice: "Book was successfully created."
    else
      render :new
    end
  end


  def new
    @book = Book.new
  end

  def upvote
    @book = Book.find(params[:id])
    @book.upvote_by current_user
    redirect_back(fallback_location: root_path)
  end

  def downvote
    @book = Book.find(params[:id])
    @book.downvote_by current_user
    redirect_back(fallback_location: root_path)
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :description, :user_id, :book_uid, :cover)
  end
end
