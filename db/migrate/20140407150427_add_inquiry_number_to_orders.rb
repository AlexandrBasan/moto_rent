class AddInquiryNumberToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :inquiry_number, :string
  end
end
