class CreateRides < ActiveRecord::Migration[7.1]
  def change
    create_table :rides do |t|
      t.references :trip, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :status, null: false, default: "joined"

      t.timestamps

      t.index [:trip_id, :user_id], unique: true
    end
  end
end
