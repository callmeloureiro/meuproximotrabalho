class AddPremiumToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :premium_expires, :datetime
    add_column :users, :user_premium, :boolean, default: false
  end
end
