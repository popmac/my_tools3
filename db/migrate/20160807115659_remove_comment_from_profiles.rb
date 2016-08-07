class RemoveCommentFromProfiles < ActiveRecord::Migration
  def change
    remove_column :profiles, :comment, :text
  end
end
