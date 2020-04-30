class CreateCreditCards < ActiveRecord::Migration[6.0]
  def change
    create_table :credit_cards do |t|
      t.string :institution_name
      t.string :card_name
      t.integer :annual_fee
      t.integer :sign_on_bonus_spending_min_dollars
      t.integer :sign_on_bonus_time_constraint_days
      t.integer :sign_on_bonus_points
      t.integer :travel_credit_dollars
      t.decimal :percent_back_dining, precision: 5, scale: 1
      t.decimal :percent_back_travel, precision: 5, scale: 1
      t.decimal :percent_back_non_travel_non_dining, precision: 5, scale: 1
      t.decimal :travel_multiplier, precision: 5, scale: 1
      t.decimal :lyft_percent_back, precision: 5, scale: 1
      t.boolean :lyft_pink_membership
      t.boolean :dashpass_membership
      t.integer :doordash_credit
      t.boolean :priority_pass_select_membership
      t.integer :global_entry_application_fee_credit_dollars
      t.integer :tsa_precheck_application_fee_credit_dollars
      t.boolean :visa_infinite_perks
      t.boolean :zero_foreign_transaction_fees

      t.timestamps
    end
  end
end
