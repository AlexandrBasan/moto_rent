class AddOauthLinkToUsers < ActiveRecord::Migration
  def change
    add_column :users, :oauth_link, :string
  end
end
