class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.text :booktitle
      t.text :author
      t.text :bookimage
      t.timestamps
    end
  end
end
