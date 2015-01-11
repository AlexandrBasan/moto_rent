class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :name
      t.string :language
      t.string :review
      t.boolean :show
      t.string :link

      t.timestamps
    end
  end
end
