class AddCountrycodeToUser < ActiveRecord::Migration
  def change
    add_column :users, :countrycode, :string
  end
end
