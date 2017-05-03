class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :office, :string
    add_column :users, :about, :text
    add_column :users, :date_of_birth, :string
    add_column :users, :zipcode, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :district, :string
    add_column :users, :address, :string
    add_column :users, :complement, :string
    add_column :users, :website, :string
    add_column :users, :phone, :string
    add_column :users, :facebook, :string
    add_column :users, :github, :string
    add_column :users, :googleplus, :string
    add_column :users, :twitter, :string
    add_column :users, :linkedin, :string
    add_column :users, :pinterest, :string
    add_column :users, :instagram, :string
  end
end
