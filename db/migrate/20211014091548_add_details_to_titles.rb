class AddDetailsToTitles < ActiveRecord::Migration[6.1]
  def change
    add_column :titles, :time, :integer
  end
end
