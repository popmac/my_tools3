ActiveAdmin.register User do

  index do
    selectable_column
    column :id do |user|
      link_to user.id, admin_user_path(user)
    end
    column :username
    column :encrypted_password
    column :created_at
    column :updated_at
    column :deleted_at
    column :deleted do |f|
      # 削除済みの場合は"削除"と表示
      f.deleted_at ? "削除済み" : nil
    end
    actions
  end

  # 削除済みのデータも取得するようにscopeを変更
  controller do
    def scoped_collection
      User.with_deleted
    end
  end

  permit_params :username, :email, :password

  form do |f|
    f.inputs do
      f.input :username
      f.input :email
      f.input :password
    end
    f.actions
  end

end
