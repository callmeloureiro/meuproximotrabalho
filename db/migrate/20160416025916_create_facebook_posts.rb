class CreateFacebookPosts < ActiveRecord::Migration
  def change
    create_table :facebook_posts do |t|
      t.text :content
      t.boolean :posted, default: false
      t.string :id_face
      t.string :email_empresa

      t.timestamps null: false
    end
  end
end
