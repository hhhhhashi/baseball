class RenameGoodRecruitIdColumnToNotifications < ActiveRecord::Migration[6.1]
  def change
    rename_column :notifications, :good_recruit_id, :recruit_id
  end
end
