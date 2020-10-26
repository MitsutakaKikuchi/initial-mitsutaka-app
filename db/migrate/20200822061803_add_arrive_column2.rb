class AddArriveColumn2 < ActiveRecord::Migration[6.0]
  def change
    add_column :arrives,:message,:string
  end
end
