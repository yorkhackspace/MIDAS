class Person < ApplicationRecord
  validates :name, presence: true
  validates :telephone, presence: true

  validates :address, presence: true, if: :member?
  validates :email, presence: true, if: :member?

  has_many :emergency_contact_relations, foreign_key: :for_id, class_name: "EmergencyContact", dependent: :destroy
  has_many :emergency_contacts, through: :emergency_contact_relations, source: :contact

  has_many :emergency_contact_for_relations, foreign_key: :contact_id, class_name: "EmergencyContact", dependent: :destroy
  has_many :emergency_contact_fors, through: :emergency_contact_for_relations, source: :for

  has_one :sso_user, dependent: :destroy

  def has_emergency_contact?
    !emergency_contacts.empty?
  end

  def is_emergency_contact?
    !emergency_contact_fors.empty?
  end
end
