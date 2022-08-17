class CreateWizardElements < ActiveRecord::Migration[7.0]
  def change
    create_table :wizard_elements do |t|
      t.references :wizard, null: false, foreign_key: true
      t.text :text
      t.boolean :question
      t.integer :order

      t.timestamps
    end
  end
end
