class LoansController < ApplicationController
  before_action :authenticate_user!

  def new
    create
  end

  def create
    @loan = Loan.new(loan_params)

    if @loan.save!
      redirect_to user_book_path(user_id: current_user.id, id: @loan.book_id), notice: "Loan was successfully created."
    else
      render user_path(user_id: current_user.id)
    end
  end

  private

  def set_loan
    @book = Loan.find(params[:id])
  end

  def loan_params
    params.permit(:book_id, :user_id, :status)
  end
end
