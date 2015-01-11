class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :currency
      t.decimal :amount
      t.string :description

      t.timestamps
    end
  end
end
