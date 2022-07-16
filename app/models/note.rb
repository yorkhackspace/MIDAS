class Note < ApplicationRecord
  belongs_to :noter, class_name: "Person"
  belongs_to :notable, polymorphic: true

  validates :noter, presence: true
  validates :notable, presence: true
end
