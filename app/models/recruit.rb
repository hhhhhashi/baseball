class Recruit < ApplicationRecord
  has_many :good_recruits, dependent: :destroy

  belongs_to :member

  has_many :applies, dependent: :destroy

  has_many :areas, dependent: :destroy

  has_many :notifications, dependent: :destroy

  enum area: {imperial_palace: 0, north: 1, east: 2, south: 3, west: 4 }

  has_one_attached :image

  def favorited_by?(member)
    good_recruits.exists?(member_id: member.id)
  end

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end


  def create_notification_like!(current_user)
    # すでに「いいね」されているか検索
    temp = Notification.where(["visitor_id = ? and visited_id = ? and recruit_id = ? and action = ? ", current_member.id, member_id, id, 'like'])
    # いいねされていない場合のみ、通知レコードを作成
    if temp.blank?
      notification = current_member.active_notifications.new(
        recruit_id: id,
        visited_id: member_id,
        action: 'like'
      )
      # 自分の投稿に対するいいねの場合は、通知済みとする
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end


  def create_notification_apply!(current_user, apply_id)
    # すでに「申し込み」されているか検索
    temp = Notification.where(["visitor_id = ? and visited_id = ? and apply_id = ? and action = ? ", current_member.id, member_id, id, 'apply'])
    # 申し込みされていない場合のみ、通知レコードを作成
    if temp.blank?
      notification = current_member.active_notifications.new(
        recruit_id: id,
        apply_id: apply_id,
        visited_id: member_id,
        action: 'apply'
      )

      notification.save if notification.valid?
    end
  end

end
