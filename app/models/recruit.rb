class Recruit < ApplicationRecord
  has_many :good_recruits, dependent: :destroy

  belongs_to :member

  has_many :applies, dependent: :destroy

  has_many :areas, dependent: :destroy

  has_one_attached :image

end
