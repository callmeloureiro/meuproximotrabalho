class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.belongs_to :user, foreign_key: true
      t.decimal :amount, :precision => 8, :scale => 2
      t.integer :days
      t.integer :order_status
      t.boolean :active

      t.timestamps
    end
  end
end
