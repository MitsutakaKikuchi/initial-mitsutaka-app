class RetypeArriveId < ActiveRecord::Migration[6.0]
  def change
    change_column :arrives, :arrive_id, 'integer USING CAST(arrive_id AS integer)'
  end
end
