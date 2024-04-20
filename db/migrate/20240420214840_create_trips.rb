class CreateTrips < ActiveRecord::Migration[7.1]
  def change
    create_table :trips do |t|
      t.string :title, null: false
      t.text :description
      t.string :origin, null: false
      t.string :destination, null: false
      t.integer :capacity, null: false, default: 20
      t.datetime :departing_at, null: false
      t.references :requester, null: false, foreign_key: { to_table: :users }
      t.references :driver, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
