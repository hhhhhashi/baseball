class PostComment < ApplicationRecord

  belongs_to :member
  belongs_to :recruit

  has_many :notifications, dependent: :destroy

  # 自分の投稿に対して誰かコメントを投稿したときに通知を投稿者に送る
  

end
