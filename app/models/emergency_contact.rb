class EmergencyContact < ApplicationRecord
  belongs_to :contact, class_name: "Person"
  belongs_to :for, class_name: "Person"
end
