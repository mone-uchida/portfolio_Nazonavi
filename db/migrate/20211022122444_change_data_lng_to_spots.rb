class ChangeDataLngToSpots < ActiveRecord::Migration[6.1]
  def change
    change_column :spots, :lng, :float
  end
end
