class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :content
      t.string :role
      t.string :language

      t.timestamps
    end
  end
end
