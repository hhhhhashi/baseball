class CreateAreas < ActiveRecord::Migration[6.1]
  def change
    create_table :areas do |t|
      t.integer :recruit_id
      t.string :place_name

      t.timestamps
    end
  end
end
