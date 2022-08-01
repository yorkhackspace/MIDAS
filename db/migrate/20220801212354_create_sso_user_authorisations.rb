class CreateSsoUserAuthorisations < ActiveRecord::Migration[7.0]
  def change
    create_table :sso_user_authorisations do |t|
      t.string :slug
      t.text :description

      t.timestamps
    end

    create_join_table :sso_users, :sso_user_authorisations do |t|
      t.index :sso_user_id
      t.index :sso_user_authorisation_id
    end
  end
end
