class AddColumnArriveUserId < ActiveRecord::Migration[6.0]
  def change
    add_column :arrives,:user_id,:integer
  end
end
