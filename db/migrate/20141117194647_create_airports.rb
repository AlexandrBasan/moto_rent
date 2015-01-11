class CreateAirports < ActiveRecord::Migration
  def change
    create_table :airports do |t|
      t.string :code
      t.string :cc_fips
      t.string :name
      t.decimal :lat
      t.decimal :long
      t.decimal :fixed_fare

      t.timestamps
    end
  end
end
