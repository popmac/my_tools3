class RemoveNicknameFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :nickname, :string
  end
end
