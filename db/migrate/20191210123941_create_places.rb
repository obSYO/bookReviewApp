class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :place_tag
      t.text :content
      t.timestamps
    end
  end
end
