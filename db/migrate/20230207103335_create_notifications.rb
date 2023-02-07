class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :visitor_id, null: false
      t.integer :visited_id, null: false
      t.integer :good_recruit_id
      t.integer :apply_id
      t.string :action, default: '', null: false
      t.boolean :checked, default: false, null: false
      
      t.timestamps
    end
    
    add_index :notifications, :visitor_id
    add_index :notifications, :visited_id
    add_index :notifications, :good_recruit_id
    add_index :notifications, :apply_id
  end
end
