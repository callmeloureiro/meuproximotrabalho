class AddIntegrateToFacebookPost < ActiveRecord::Migration
  def change
    add_column :facebook_posts, :integrate, :boolean, default: false
  end
end
