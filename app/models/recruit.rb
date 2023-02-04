class Recruit < ApplicationRecord
  has_many :good_recruits, dependent: :destroy

  belongs_to :member

  has_many :applies, dependent: :destroy

  has_many :areas, dependent: :destroy
  
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

end
