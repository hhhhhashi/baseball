class AddPostCommentIdToNotifications < ActiveRecord::Migration[6.1]
  def change
    add_column :notifications, :post_comment_id, :integer
  end
end
