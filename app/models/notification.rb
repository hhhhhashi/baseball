class Notification < ApplicationRecord

  default_scope -> { order(created_at: :desc) }
  belongs_to :good_recruit, optional: true
  belongs_to :apply, optional: true
  belongs_to :post_comment, optional: true
  
  belongs_to :recruit, optional: true

  belongs_to :visitor, class_name: 'Member', foreign_key: 'visitor_id', optional: true
  belongs_to :visited, class_name: 'Member', foreign_key: 'visited_id', optional: true
end
