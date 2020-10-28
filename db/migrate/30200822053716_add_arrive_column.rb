class AddArriveColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :arrives,:time,:string
    add_column :arrives,:pick_up,:string
    add_column :arrives,:absence,:string
  end
end
