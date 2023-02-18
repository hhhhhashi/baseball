class CreatePostComments < ActiveRecord::Migration[6.1]
  def change
    create_table :post_comments do |t|
      
      t.integer :recruit_id
      t.integer :member_id
      t.text :comment
      
      t.timestamps
    end
  end
end
