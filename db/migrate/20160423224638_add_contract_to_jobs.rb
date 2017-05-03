class AddContractToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :contract, :string
  end
end
