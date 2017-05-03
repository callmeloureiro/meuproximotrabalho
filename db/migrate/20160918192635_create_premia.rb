class CreatePremia < ActiveRecord::Migration[5.0]
  def change
    create_table :premia do |t|
      t.integer :days
      t.decimal :price, :precision => 8, :scale => 2
      t.boolean :status, default: true

      t.timestamps
    end
  end
end
