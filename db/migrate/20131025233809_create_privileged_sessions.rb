class CreatePrivilegedSessions < ActiveRecord::Migration
  def change
    create_table :privileged_sessions do |t|
      t.belongs_to :user, index: true
      t.string :key
      t.datetime :revoked_at

      t.timestamps
    end
  end
end
