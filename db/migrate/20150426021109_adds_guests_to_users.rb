class AddsGuestsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :guests, :string
  end
end
