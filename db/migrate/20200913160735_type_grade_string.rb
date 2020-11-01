class TypeGradeString < ActiveRecord::Migration[6.0]
  def change
    change_column :users2s, :grade, :string
  end
end
