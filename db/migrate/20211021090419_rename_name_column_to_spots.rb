class RenameNameColumnToSpots < ActiveRecord::Migration[6.1]
  def change
    rename_column :spots, :name, :place
  end
end
