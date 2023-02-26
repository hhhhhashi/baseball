class Recruit < ApplicationRecord
  has_many :good_recruits, dependent: :destroy

  has_many :post_comments, dependent: :destroy

  belongs_to :member

  has_many :applies, dependent: :destroy

  has_many :areas, dependent: :destroy

  has_many :notifications, dependent: :destroy, foreign_key: 'visited_id'

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
      image.variant(resize_to_limit: [300, 300]).processed
  end


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
      post_comment_id: post_comment_id,
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
