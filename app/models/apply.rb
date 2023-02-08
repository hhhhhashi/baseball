class Apply < ApplicationRecord
  belongs_to :recruit

  belongs_to :member

  has_many :notifications, dependent: :destroy

  enum is_apply: {examination: 0, approval: 1, deny: 2 }

    def create_notification_apply!(current_member,member_id, apply_id)
    # すでに「申し込み」されているか検索
      temp = Notification.where(["visitor_id = ? and visited_id = ? and apply_id = ? and action = ? ", current_member.id, member_id, apply_id, 'apply'])
      # 申し込みされていない場合のみ、通知レコードを作成
      if temp.blank?
        notification = Notification.new(
          visitor_id: current_member.id,
          apply_id: apply_id,
          visited_id: member_id,
          action: 'apply'
        )

        notification.save if notification.valid?
      end
    end


end
