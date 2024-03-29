class Keyset < ApplicationRecord
  has_one :membership

  has_many :notes, as: :notable, dependent: :destroy

  scope :available, -> { includes(:membership).where(membership: { keyset: nil }) }

  def available?
    membership.nil?
  end
end
