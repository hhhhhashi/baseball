class Apply < ApplicationRecord
  belongs_to :recruit

  belongs_to :member
  
  has_many :notifications, dependent: :destroy
  
  enum is_apply: {examination: 0, approval: 1, deny: 2 }
  
  
  
  
end
