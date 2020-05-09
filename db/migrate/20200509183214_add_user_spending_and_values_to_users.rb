class AddUserSpendingAndValuesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :spending_amount_movable_monthly, :boolean
    add_column :users, :spending_willing_to_change_credit_cards_monthly, :integer
    add_column :users, :spending_lyft_total_monthly, :integer
    add_column :users, :personal_value_lyft_priority_airport_pickup_12mo, :integer
    add_column :users, :personal_value_lyft_cancel_ride_times_monthly, :integer
    add_column :users, :personal_value_lyft_lose_something_times_12mo, :integer
    add_column :users, :spending_meal_deliverly_total_monthly, :integer
    add_column :users, :spending_meal_deliverly_delivery_fee_monthly, :integer
    add_column :users, :spending_travel_flights_next_12mo, :integer
    add_column :users, :spending_travel_hotels_next_12mo, :integer
    add_column :users, :personal_value_travel_airport_lounge_access_12mo, :integer
    add_column :users, :personal_value_concierge_service, :integer
    add_column :users, :spending_dining_total_monthly, :integer
    add_column :users, :global_entry_boolean, :boolean
    add_column :users, :tsa_pre_boolean, :boolean
    add_column :users, :personal_value_global_entry_and_tsa_pre, :integer
    add_column :users, :personal_value_global_entry, :integer
    add_column :users, :personal_value_tsa_pre, :integer
  end
end
