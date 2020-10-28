class AddArriveKanaGrade < ActiveRecord::Migration[6.0]
  def change
    add_column :arrives,:kana,:string
    add_column :arrives,:grade,:string
  end
end
