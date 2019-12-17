class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.text :booktitle, null: false
      t.text :author,    null: false
      t.text :bookimage
      t.timestamps
      t.integer :user_id
    end
  end
end
