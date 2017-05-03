class AddTypeToFacebookPost < ActiveRecord::Migration
  def change
    add_column :facebook_posts, :type_post, :integer, default: 0
    add_column :facebook_posts, :email_user, :string
  end
end
