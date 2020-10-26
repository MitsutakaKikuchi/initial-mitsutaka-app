class CreateArrives < ActiveRecord::Migration[6.0]
  def change
    create_table :arrives do |t|
      t.string :user_id

      t.timestamps
    end
  end
end
