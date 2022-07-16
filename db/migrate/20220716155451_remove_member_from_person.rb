class RemoveMemberFromPerson < ActiveRecord::Migration[7.0]
  def change
    remove_column :persons, :member, :boolean
  end
end
