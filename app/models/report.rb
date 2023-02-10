class Report < ApplicationRecord
  belongs_to :reporter, class_name: "Member"
  belongs_to :reported, class_name: "Member"
end
