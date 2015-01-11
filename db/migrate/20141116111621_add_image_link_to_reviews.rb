class AddImageLinkToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :image_link, :string
  end
end
