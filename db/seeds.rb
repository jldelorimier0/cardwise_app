# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

CreditCard.create(institution_name: "Chase", card_name: "Chase Sapphire Reserve", annual_fee: 550, sign_on_bonus_spending_min_dollars: 4000, sign_on_bonus_time_constraint_days: 90, sign_on_bonus_points: 50000, travel_credit_dollars: 300, percent_back_dining: 3, percent_back_travel: 3, percent_back_non_travel_non_dining: 1, travel_multiplier: 1.5, lyft_percent_back: 10, lyft_pink_membership: true, dashpass_membership: true, doordash_credit: 60, priority_pass_select_membership: true, global_entry_application_fee_credit_dollars: 100, tsa_precheck_application_fee_credit_dollars: 85, visa_infinite_perks: true, zero_foreign_transaction_fees: true)