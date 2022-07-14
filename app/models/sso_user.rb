class SsoUser < ApplicationRecord
  validates :person, presence: true
  belongs_to :person

  has_secure_password validations: false
end
