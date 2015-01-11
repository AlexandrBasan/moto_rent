class CreateTransactionHistories < ActiveRecord::Migration
  def change
    create_table :transaction_histories do |t|
      t.string :currency
      t.decimal :amount
      t.string :description
      t.string :operation
      t.string :inquiry_number

      t.timestamps
    end
  end
end
