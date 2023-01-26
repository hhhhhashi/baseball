class CreateGoodRecruits < ActiveRecord::Migration[6.1]
  def change
    create_table :good_recruits do |t|

      t.integer :member_id
      t.integer :recruit_id

      t.timestamps
    end
  end
end
