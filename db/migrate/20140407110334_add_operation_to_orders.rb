class AddOperationToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :operation, :string
  end
end
