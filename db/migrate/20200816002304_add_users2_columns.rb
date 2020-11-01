class AddUsers2Columns < ActiveRecord::Migration[6.0]
  def change
    add_column :users2s,:name,:string
    add_column :users2s,:kana,:string
    add_column :users2s,:time,:integer
    add_column :users2s,:color,:string
  end
end
