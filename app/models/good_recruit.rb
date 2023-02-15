class GoodRecruit < ApplicationRecord
  belongs_to :member

  belongs_to :recruit

  has_many :notifications, dependent: :destroy

  def create_notification_good_recruit!(current_member, member_id, good_recruit_id )
    # すでに「いいね」されているか検索
    temp = Notification.where(["visitor_id = ? and visited_id = ? and good_recruit_id = ? and action = ? ", current_member.id, member_id, good_recruit_id, 'good_recruit'])
    # いいねされていない場合のみ、通知レコードを作成
    if temp.blank?
      notification = Notification.new(
        visitor_id: current_member.id,
        good_recruit_id: good_recruit_id,
        visited_id: member_id,
        action: 'good_recruit'
      )

      notification.save if notification.valid?
    end
  end

end
