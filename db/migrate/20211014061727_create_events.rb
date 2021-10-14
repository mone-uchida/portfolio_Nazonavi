class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.integer :spot_id
      t.integer :title_id
      t.date :start_at
      t.date :finish_at

      t.timestamps
    end
  end
end
