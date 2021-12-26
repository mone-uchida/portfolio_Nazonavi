class RenameEventIdColumnToPosts < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :event_id, :title_id
  end
end
