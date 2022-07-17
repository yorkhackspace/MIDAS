class CreateKeysets < ActiveRecord::Migration[7.0]
  def change
    create_table :keysets do |t|
      t.string :fob_number

      t.timestamps
    end
  end
end
