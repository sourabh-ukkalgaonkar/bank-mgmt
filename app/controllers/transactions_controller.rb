class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @transactions = current_user.transactions
  end

  def new
    @transaction = current_user.transactions.new
  end

  def create
    @transaction = current_user.transactions.new(transactions_params)
    if @transaction.save
      current_user.update(balance: @transaction.updated_balance)
      redirect_to root_path, notice: "your transcation takes place successfully"
    else
      render :new
    end
  end


  private

  def transactions_params
    params.require(:transaction).permit(:transaction_type, :amount)
  end
end