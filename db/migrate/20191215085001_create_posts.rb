class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :book_id
      t.text :title,       null: false
      t.text :reviewText,  null: false
      t.timestamps
    end
  end
end