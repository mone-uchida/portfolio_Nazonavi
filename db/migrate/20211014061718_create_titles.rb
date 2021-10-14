class CreateTitles < ActiveRecord::Migration[6.1]
  def change
    create_table :titles do |t|
      t.string :name
      t.string :image
      t.integer :price
      t.string :url
      t.string :source
      t.text :note

      t.timestamps
    end
  end
end
