class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :email
      t.string :name_offerer
      t.string :zipcode
      t.string :city
      t.string :state
      t.string :district
      t.string :address
      t.string :complement
      t.string :workload
      t.decimal :price, :precision => 8, :scale => 2
      t.string :type_offer
      t.string :experience
      t.string :occupation
      t.string :office
      t.text :description
      t.text :responsibilities
      t.text :requirements
      t.text :differential
      t.belongs_to :user, index: true
      t.timestamps null: false
    end
  end
end
