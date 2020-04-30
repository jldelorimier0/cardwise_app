# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_30_015532) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "credit_cards", force: :cascade do |t|
    t.string "institution_name"
    t.string "card_name"
    t.integer "annual_fee"
    t.integer "sign_on_bonus_spending_min_dollars"
    t.integer "sign_on_bonus_time_constraint_days"
    t.integer "sign_on_bonus_points"
    t.integer "travel_credit_dollars"
    t.decimal "percent_back_dining", precision: 5, scale: 1
    t.decimal "percent_back_travel", precision: 5, scale: 1
    t.decimal "percent_back_non_travel_non_dining", precision: 5, scale: 1
    t.decimal "travel_multiplier", precision: 5, scale: 1
    t.decimal "lyft_percent_back", precision: 5, scale: 1
    t.boolean "lyft_pink_membership"
    t.boolean "dashpass_membership"
    t.integer "doordash_credit"
    t.boolean "priority_pass_select_membership"
    t.integer "global_entry_application_fee_credit_dollars"
    t.integer "tsa_precheck_application_fee_credit_dollars"
    t.boolean "visa_infinite_perks"
    t.boolean "zero_foreign_transaction_fees"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
