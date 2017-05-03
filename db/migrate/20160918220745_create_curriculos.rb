class CreateCurriculos < ActiveRecord::Migration[5.0]
  def change
    create_table :curriculos do |t|
      t.belongs_to :user, foreign_key: true
      t.integer :status, default: 0
      t.text :obs
      t.integer :type_cv, default: 0

      t.timestamps
    end
  end
end
