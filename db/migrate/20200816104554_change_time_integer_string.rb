class ChangeTimeIntegerString < ActiveRecord::Migration[6.0]
  def change
    change_column :users2s,:time,:string
  end
end
