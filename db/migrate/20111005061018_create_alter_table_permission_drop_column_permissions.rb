class CreateAlterTablePermissionDropColumnPermissions < ActiveRecord::Migration
  def self.up
    drop_table "alter_table_permission_drop_column_permissions"

    end
  end

  def self.down
    drop_table "alter_table_permission_drop_column_permissions"
  end
end
