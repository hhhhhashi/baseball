class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.integer :reporter_id, null: false
      t.integer :reported_id, null: false
      t.text :reason, null: false
      t.text :url
      t.integer :status, default: 0, null: false

      #enum status: { waiting: 0, keep: 1, finish: 2 }

      t.timestamps
    end
  end
end
