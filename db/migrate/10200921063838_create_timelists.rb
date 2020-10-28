class CreateTimelists < ActiveRecord::Migration[6.0]
  def change
    create_table :timelists do |t|
      t.string :time

      t.timestamps
    end
  end
end
