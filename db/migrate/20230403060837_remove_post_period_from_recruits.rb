class RemovePostPeriodFromRecruits < ActiveRecord::Migration[6.1]
  def change
    remove_column :recruits, :post_period, :string
  end
end
