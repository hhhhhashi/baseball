class GoodRecruit < ApplicationRecord
  belongs_to :member

  has_many :recruits, dependent: :destroy

end
