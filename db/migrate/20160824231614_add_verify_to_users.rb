class AddVerifyToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :user_verify, :boolean, default: false
  end
end
