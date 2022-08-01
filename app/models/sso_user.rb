class SsoUser < ApplicationRecord
  validates :person, presence: true
  belongs_to :person

  has_and_belongs_to_many :sso_user_authorisations

  has_secure_password validations: false
end
