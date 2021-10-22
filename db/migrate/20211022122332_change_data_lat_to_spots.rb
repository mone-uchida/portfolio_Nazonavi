class ChangeDataLatToSpots < ActiveRecord::Migration[6.1]
  def change
    change_column :spots, :lat, :float
  end
end
