class AddPostedatToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :posted_at, :datetime
  end
end
