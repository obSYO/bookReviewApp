class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.text :booktitle, index: true, unique: true, null: false
      t.text :author,    index: true, unique: true, null: false
      t.text :bookimage
      t.timestamps
      t.references :user, foreign_key: true
    end
  end
end
