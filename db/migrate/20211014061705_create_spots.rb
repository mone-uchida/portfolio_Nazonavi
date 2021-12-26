class CreateSpots < ActiveRecord::Migration[6.1]
  def change
    create_table :spots do |t|
      t.string :name
      t.string :address
      t.string :lat
      t.string :lng
      t.string :url

      t.timestamps
    end
  end
end
