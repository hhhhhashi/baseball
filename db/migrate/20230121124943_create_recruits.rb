class CreateRecruits < ActiveRecord::Migration[6.1]
  def change
    create_table :recruits do |t|

      t.integer :member_id
      t.string :title, null: false
      t.string :team, null: false
      t.string :place
      t.string :area
      t.datetime :day_and_time, null: false
      t.integer :team_level, null: false
      t.string :post_period, null: false
      t.text :content, null: false
      t.timestamps
    end
  end
end
