class Transaction < ApplicationRecord
  belongs_to :user

  enum transaction_type: [ :withdraw, :deposit ]

  validates :amount, numericality: true
  validate :check_withdraw

  before_create :set_balance

  private

  def set_balance
    self.balance_before_updation = user.balance
    if transaction_type == 'deposit' 
      self.updated_balance = user.balance + self.amount
    else
      self.updated_balance = user.balance - self.amount
    end  
  end

  def check_withdraw
    if (user.balance - self.amount) < 0
      errors.add(:base, "you can't withdraw amount more than your balance")
    end
  end
end
