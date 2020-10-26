class AddUserId < ActiveRecord::Migration[6.0]
  def change
    add_column :users2s,:user_id,:string
  end
end
