class CreateCats < ActiveRecord::Migration[5.2]
  def change
    create_table :cats do |t|
      t.string :name
      t.integer :lives
      t.string :state
      t.timestamp :state_updated_at

      t.timestamps
    end
  end
end
