class AddUsers2sUserIndex < ActiveRecord::Migration[6.0]
  def change
    add_column :users2s,:user_index,:integer
  end
end
