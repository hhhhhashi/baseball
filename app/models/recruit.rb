class Recruit < ApplicationRecord
  belongs_to :good_recruit

  belongs_to :member

  has_many :applies, dependent: :destroy

  has_many :areaes, dependent: :destroy
end
