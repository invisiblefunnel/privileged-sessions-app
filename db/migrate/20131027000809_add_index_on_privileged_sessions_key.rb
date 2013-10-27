class AddIndexOnPrivilegedSessionsKey < ActiveRecord::Migration
  def change
    add_index :privileged_sessions, :key, unique: true
  end
end
