class PostComment < ApplicationRecord

  belongs_to :member
  belongs_to :recruit
  
  has_many :notifications, dependent: :destroy
  
  def create_notification_post_comment!(current_member, post_comment_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    temp_ids = PostComment.select(:member_id).where(recruit_id: id).where.not(member_id: current_member.id).distinct
    temp_ids.each do |temp_id|
      save_notification_post_comment!(current_member, post_comment_id, temp_id['member_id'])
    end
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    save_notification_post_comment!(current_member, post_comment_id, member_id) if temp_ids.blank?
  end

  def save_notification_post_comment!(current_member, post_comment_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_member.active_notifications.new(
      recruit_id: id,
      post_comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end

end
