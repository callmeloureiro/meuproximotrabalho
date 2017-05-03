class AddOwnerToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :owner, :boolean, default: false
  end
end
