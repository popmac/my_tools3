ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "登録したユーザー数" do
          User.with_deleted.count
        end
      end
    end
    columns do
      column do
        panel "アクティブなユーザー数" do
          User.all.count
        end
      end
    end
  end
end
