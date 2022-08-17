class WizardCompletion < ApplicationRecord
  belongs_to :signer, class_name: "Person"
  belongs_to :signee, class_name: "Person"
  belongs_to :wizard

  has_many :notes, as: :notable

  validates :signee, presence: true
end
