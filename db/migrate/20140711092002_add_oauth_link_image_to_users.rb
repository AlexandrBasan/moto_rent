class AddOauthLinkImageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :oauth_link_image, :string
  end
end
