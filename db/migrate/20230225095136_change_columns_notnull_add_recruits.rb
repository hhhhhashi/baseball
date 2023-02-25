class ChangeColumnsNotnullAddRecruits < ActiveRecord::Migration[6.1]
  def change
    change_column :recruits, :title, :string, null: false
  end
end
