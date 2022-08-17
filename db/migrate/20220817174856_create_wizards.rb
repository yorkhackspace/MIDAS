class CreateWizards < ActiveRecord::Migration[7.0]
  def change
    create_table :wizards do |t|
      t.string :name
      t.text :description
      t.references :sso_user_authorisation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
