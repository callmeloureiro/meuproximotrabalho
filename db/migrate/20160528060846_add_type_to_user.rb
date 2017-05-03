class AddTypeToUser < ActiveRecord::Migration
  def change
    add_column :users, :type_user, :integer, default: 0
  end
end
