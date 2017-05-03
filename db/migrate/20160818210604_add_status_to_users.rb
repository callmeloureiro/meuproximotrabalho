class AddStatusToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :status, :boolean, default: true
    add_column :users, :message_status, :text
  end
end
