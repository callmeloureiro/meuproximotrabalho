class AddNumberToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :number, :string
    add_column :jobs, :number, :string
  end
end
