class SsoUserAuthorisation < ApplicationRecord
  has_and_belongs_to_many :sso_users

  has_many :notes, as: :notable
end
