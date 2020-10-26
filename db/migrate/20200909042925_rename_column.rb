class RenameColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :arrives, :user_id, :arrive_id
  end
end
