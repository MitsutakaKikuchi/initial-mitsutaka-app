class RetypeArriveId < ActiveRecord::Migration[6.0]
  def change
    change_column :arrives, :arrive_id, :integer
  end
end
