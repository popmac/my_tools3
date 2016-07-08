class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer     :age
      t.string      :job
      t.text        :comment
      t.integer     :user_id
      t.timestamps
    end
  end
end
