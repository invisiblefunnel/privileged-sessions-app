class RemoveNotes < ActiveRecord::Migration
  def up
    drop_table :notes
  end

  def down
    create_table :notes do |t|
      t.text :content
      t.belongs_to :user

      t.timestamps
    end
    add_index :notes, :user_id
  end
end
