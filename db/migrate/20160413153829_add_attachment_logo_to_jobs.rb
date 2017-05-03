class AddAttachmentLogoToJobs < ActiveRecord::Migration
  def self.up
    change_table :jobs do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :jobs, :logo
  end
end
