class CreateVehicletypes < ActiveRecord::Migration
  def change
    create_table :vehicletypes do |t|
      t.string :vtype
      t.string :vdescription
      t.string :image
      t.integer :passnum
      t.integer :bagagenum

      t.timestamps
    end
  end
end
