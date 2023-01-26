class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :good_recruits, dependent: :destroy

  has_many :recruits, dependent: :destroy

  has_many :applies, dependent: :destroy

end
