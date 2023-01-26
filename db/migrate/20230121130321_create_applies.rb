class CreateApplies < ActiveRecord::Migration[6.1]
  def change
    create_table :applies do |t|
      
      t.integer :member_id
      t.integer :recruit_id
      t.boolean :is_apply

      t.timestamps
    end
  end
end
