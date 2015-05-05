class AddUuidAndRefreshedAtToUsers < ActiveRecord::Migration
  def change
    add_column :users, :uuid, :string
    add_index :users, :uuid
    add_column :users, :refreshed_at, :datetime
  end
end
