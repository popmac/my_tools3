class AddIntroduceToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :introduce, :text
  end
end
