class AddKeysetToMembership < ActiveRecord::Migration[7.0]
  def change
    add_reference :memberships, :keyset, foreign_key: true
  end
end
