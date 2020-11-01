class RenameUsers2 < ActiveRecord::Migration[6.0]
  def change
    rename_column :users2s, :user_index, :arrive_id
  end
end
