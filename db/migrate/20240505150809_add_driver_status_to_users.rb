class AddDriverStatusToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :driver_status, :string
  end
end
