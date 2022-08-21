class Wizard < ApplicationRecord
  belongs_to :sso_user_authorisation
  has_many :wizard_elements
  has_many :wizard_completions
  has_many :notes, as: :notable, dependent: :destroy
end
