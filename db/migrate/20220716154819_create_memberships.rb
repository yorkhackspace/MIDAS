class CreateMemberships < ActiveRecord::Migration[7.0]
  def change
    create_table :memberships do |t|
      t.references :person, null: false, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
