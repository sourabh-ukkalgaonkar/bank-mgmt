class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer :transaction_type
      t.decimal :amount
      t.decimal :updated_balance, default: 0.0, precision: 5, scale: 2
      t.decimal :balance_before_updation, default: 0.0, precision: 5, scale: 2
      t.integer :user_id

      t.timestamps
    end

    add_index :transactions, :user_id
  end
end
