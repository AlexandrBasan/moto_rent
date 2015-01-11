class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.integer :user_id
      t.string :address
      t.string :name

      t.timestamps
    end
  end
end
