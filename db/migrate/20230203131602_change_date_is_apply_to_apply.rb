class ChangeDateIsApplyToApply < ActiveRecord::Migration[6.1]
  def change
    change_column :applies, :is_apply, :integer
  end
end
