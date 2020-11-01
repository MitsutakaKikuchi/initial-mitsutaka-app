class TypeGrade < ActiveRecord::Migration[6.0]
  def change
    change_column :users2s, :grade, :integer
  end
end
