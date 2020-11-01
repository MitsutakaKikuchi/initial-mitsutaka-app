class TypeChangeUser2UserId < ActiveRecord::Migration[6.0]
  def change
    change_column :users2s, :user_id, :integer
  end
end
