class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.text :title,       null: false
      t.text :reviewText,  null: false
      t.timestamps
    end
  end
end
