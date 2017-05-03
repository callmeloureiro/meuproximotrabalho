class AddScheduleToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :schedule_time, :datetime
    add_column :jobs, :schedule_type, :boolean, default: false
    add_column :jobs, :posted, :boolean, default: false
  end
end
