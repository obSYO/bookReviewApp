class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :nickname null: false
      t.string :title    null: false
      t.text :reviewText null: false

      t.timestamps
    end
  end
end
