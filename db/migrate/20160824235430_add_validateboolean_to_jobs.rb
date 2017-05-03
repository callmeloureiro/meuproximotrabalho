class AddValidatebooleanToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :end_date_type, :boolean
  end
end
