# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :set_book, except: %i[index new create]
  before_action :authenticate_user!, except: [:index]

  def index
    @books = Book.all
    @q = Book.ransack(params[:q])
    @books = @q.result(distinct: true)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id

    if @book.save
      redirect_to user_book_path(current_user, @book), notice: 'Book was successfully created.'
    else
      render :new
    end
  end

  def borrow
    @loan = Loan.new(
      book: @book,
      user: current_user,
      status: Book::STATUS_BORROWED
    )
    if @loan.save!
      redirect_to user_book_path(user_id: current_user.id, id: @loan.book_id),
      notice: 'Loan was successfully created.'
    else
      render user_path(user_id: current_user.id)
    end
  end

  def return
    borrower = @book.loans.where(status: Book::STATUS_BORROWED).order(created_at: :desc).first.user
    @loan = Loan.new(
      book: @book,
      user: borrower,
      status: Book::STATUS_RETURNED
    )
    if @loan.save!
      redirect_to user_book_path(user_id: current_user.id, id: @loan.book_id),
        notice: 'Loan was successfully created.'
    else
      render user_path(user_id: current_user.id)
    end
  end

  def edit; end

  def destroy
    @book.destroy
    redirect_to user_path(current_user)
  end

  def update
    if @book.update(book_params)
      redirect_to user_book_path(current_user, @book), notice: 'Book updated!'
    else
      render :edit, notice: 'Book not updated.'
    end
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
    params.require(:book).permit(
      :title,
      :author,
      :description,
      :user_id,
      :book_uid,
      :cover
    )
  end
end
