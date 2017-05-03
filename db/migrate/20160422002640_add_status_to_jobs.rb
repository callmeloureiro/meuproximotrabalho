class AddStatusToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :status, :integer, default: 0
    add_column :jobs, :closed, :boolean, default: false
  end
end
