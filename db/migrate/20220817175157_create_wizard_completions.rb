class CreateWizardCompletions < ActiveRecord::Migration[7.0]
  def change
    create_table :wizard_completions do |t|
      t.references :signer, null: false, foreign_key: { to_table: :persons }
      t.references :signee, null: false, foreign_key: { to_table: :persons }
      t.references :wizard, null: false, foreign_key: true
      t.boolean :needs_review

      t.timestamps
    end
  end
end
