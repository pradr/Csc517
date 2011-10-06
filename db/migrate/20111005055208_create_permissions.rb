class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.integer :user_id
      t.boolean :permission

      t.timestamps

      remove_column :permission, :permission
    end
  end
end
