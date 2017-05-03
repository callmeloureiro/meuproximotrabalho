class AddVerifyToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :job_verify, :boolean, default: false
  end
end
