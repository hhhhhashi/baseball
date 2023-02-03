class ChangeDateAreaToRecruit < ActiveRecord::Migration[6.1]
  def change
    change_column :recruits, :area, :integer
  end
end
