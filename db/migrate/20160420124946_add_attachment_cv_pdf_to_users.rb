class AddAttachmentCvPdfToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :cv_pdf
    end
  end

  def self.down
    remove_attachment :users, :cv_pdf
  end
end
