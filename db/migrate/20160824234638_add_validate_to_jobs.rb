class AddValidateToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :end_date, :datetime
  end
end
