class AddPaymentSystemToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :payment_system, :string
  end
end
