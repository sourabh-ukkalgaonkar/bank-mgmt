class TransactionMailer < ApplicationMailer
  default from: ENV['gmail_username']
 
  def email(transaction)
    @transaction = transaction
    mail(to: @transaction.ser.email, subject: 'Transcation confirmation')
  end
end