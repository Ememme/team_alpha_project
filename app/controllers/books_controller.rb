class BooksController < ApplicationController
  before_action :set_book, only: %i[show destroy]
  before_action :authenticate_user!, except: [:index]

  def index
    @books = Book.all
  end

  def show; end

  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: "Book was successfully created." }
      else
        format.html { render :new }
      end
    end
  end

  def destroy; end

  def new
    @book = Book.new
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :description, :user_id, :book_uid, :cover)
  end
end