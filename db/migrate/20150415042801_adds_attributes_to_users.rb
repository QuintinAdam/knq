class AddsAttributesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone, :string
    add_column :users, :will_attend, :boolean
    add_column :users, :street_address, :string
    add_column :users, :city, :string
    add_column :users, :state_region, :string
    add_column :users, :postal_code, :string
    add_column :users, :country, :string
    add_column :users, :birthday, :date
    add_column :users, :message, :text
  end
end
