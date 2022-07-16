class Membership < ApplicationRecord
  belongs_to :person

  enum status: {
    active: 1,
    new: 2,
    unpaid: 3,
    left_outstanding: 4,
    left_closed_off: 5
  }, _prefix: true

  validates :person, presence: true
  validates :status, inclusion: { in: statuses.keys }

  has_many :notes, as: :notable
end
