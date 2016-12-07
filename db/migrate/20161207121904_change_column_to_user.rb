class ChangeColumnToUser < ActiveRecord::Migration
  def up
    remove_index :users, :email
    add_index :users, [:email, :deleted_at], unique: true, name: 'index_users_on_email_and_deleted_at'
  end
  def down
    remove_index :users, [:email, :deleted_at]
    add_index :users, :email, unique: true
  end
end
