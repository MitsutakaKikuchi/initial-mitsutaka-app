class CreateUsers2s < ActiveRecord::Migration[6.0]
  def change
    create_table :users2s do |t|

      t.timestamps
    end
  end
end
