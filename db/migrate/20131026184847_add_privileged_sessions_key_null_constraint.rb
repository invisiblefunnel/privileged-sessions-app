class AddPrivilegedSessionsKeyNullConstraint < ActiveRecord::Migration
  def up
    change_column :privileged_sessions, :key, :string, null: false
  end

  def down
    change_column :privileged_sessions, :key, :string
  end
end
