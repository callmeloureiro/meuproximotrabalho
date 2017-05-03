class CreateJobApplies < ActiveRecord::Migration
  def change
    create_table :job_applies do |t|
      t.references :user, index: true, foreign_key: true
      t.references :job, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
