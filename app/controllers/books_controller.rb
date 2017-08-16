class BooksController < ApplicationController
  before_action :set_book, only: %i[show destroy borrow]
  before_action :authenticate_user!, except: [:index]

  def index
    @books = Book.all
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

  def borrow
    @loan = Loan.new(
      book: @book,
      user: current_user,
      status: Loan::STATUS_BORROWED
    )
    if @loan.save!
      redirect_to user_book_path(user_id: current_user.id, id: @loan.book_id), notice: "Loan was successfully created."
    else
      render user_path(user_id: current_user.id)
    end
  end

  # def return
  #   @loan = Loan.new(
  #     book: book,
  #     user: borrower,
  #     status: Loan::STATUS_BORROWED
  #   )
  #   if @loan.save!
  #     redirect_to user_book_path(user_id: current_user.id, id: @loan.book_id), notice: "Loan was successfully created."
  #   else
  #     render user_path(user_id: current_user.id)
  #   end
  # end


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

  # def borrower
  #  book.loans.user
  # end

  def book_params
    params.require(:book).permit(:title, :author, :description, :user_id, :book_uid, :cover)
  end
end
