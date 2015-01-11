class DropColum < ActiveRecord::Migration
  def change
    remove_column :orders, :operation
    remove_column :orders, :inquiry_number
  end
end
