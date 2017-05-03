class Slugs < ActiveRecord::Migration
  def change
    add_column :jobs, :slug, :string, unique: true
  end
end
