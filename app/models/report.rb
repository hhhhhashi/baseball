class Report < ApplicationRecord
  belongs_to :reporter, class_name: "Member"
  belongs_to :reported, class_name: "Member"
  
  enum status: { waiting: 0, keep: 1, finish: 2 
end
