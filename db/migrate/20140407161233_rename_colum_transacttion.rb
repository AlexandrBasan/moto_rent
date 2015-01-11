class RenameColumTransacttion < ActiveRecord::Migration
  def change
    rename_table :transaction_histories, :transactions
  end
end
