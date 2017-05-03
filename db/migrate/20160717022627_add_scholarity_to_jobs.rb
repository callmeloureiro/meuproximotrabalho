class AddScholarityToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :scholarity, :string
  end
end
