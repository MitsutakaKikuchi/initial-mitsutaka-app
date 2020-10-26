class AddUsers2Grade < ActiveRecord::Migration[6.0]
  def change
    add_column :users2s,:grade,:string
  end
end
