class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.integer :airport_id
      t.string :name
      t.string :address
      t.string :address_description
      t.time :avg_duration_min
      t.decimal :distance
      t.decimal :lat
      t.decimal :long

      t.timestamps
    end
  end
end
