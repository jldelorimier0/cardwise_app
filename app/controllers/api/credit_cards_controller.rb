class Api::CreditCardsController < ApplicationController
  def index
    @credit_cards = CreditCard.all
    render "index.json.jb"
  end
  def create
    @credit_card = CreditCard.new(
    institution_name: params[:institution_name],
    card_name: params[:card_name],
    annual_fee: params[:annual_fee],
    sign_on_bonus_spending_min_dollars: params[:sign_on_bonus_spending_min_dollars],
    sign_on_bonus_time_constraint_days: params[:sign_on_bonus_time_constraint_days],
    sign_on_bonus_points: params[:sign_on_bonus_points],
    travel_credit_dollars: params[:travel_credit_dollars],
    percent_back_dining: params[:percent_back_dining],
    percent_back_travel: params[:percent_back_travel],
    percent_back_non_travel_non_dining: params[:percent_back_non_travel_non_dining],
    travel_multiplier: params[:travel_multiplier],
    lyft_percent_back: params[:lyft_percent_back],
    lyft_pink_membership: params[:lyft_pink_membership],
    dashpass_membership: params[:dashpass_membership],
    doordash_credit: params[:doordash_credit],
    priority_pass_select_membership: params[:priority_pass_select_membership],
    global_entry_application_fee_credit_dollars: params[:global_entry_application_fee_credit_dollars],
    tsa_precheck_application_fee_credit_dollars: params[:tsa_precheck_application_fee_credit_dollars],
    visa_infinite_perks: params[:visa_infinite_perks],
    zero_foreign_transaction_fees: params[:zero_foreign_transaction_fees]
    )
    @credit_card.save
    render "show.json.jb"
  end
  p "BEFORE THE CSR COST BENEFIT METHOD"
  def chase_sapphire_reserve_cost_benefit_analysis
    answers = { 
      :spending_total_all_credit_cards_monthly => @user.spending_total_all_credit_cards_monthly,
      :spending_amount_movable_monthly => @user.spending_amount_movable_monthly, 
      :spending_willing_to_change_credit_cards_monthly => @user.spending_willing_to_change_credit_cards_monthly, 
      :spending_lyft_total_monthly => @user.spending_lyft_total_monthly, 
      :personal_value_lyft_priority_airport_pickup_12mo => @user.personal_value_lyft_priority_airport_pickup_12mo, 
      :personal_value_lyft_cancel_ride_times_monthly => @user.personal_value_lyft_cancel_ride_times_monthly, 
      :personal_value_lyft_lose_something_times_12mo => @user.personal_value_lyft_lose_something_times_12mo, 
      :spending_meal_deliverly_total_monthly => @user.spending_meal_deliverly_total_monthly, 
      :spending_meal_deliverly_delivery_fee_monthly => @user.spending_meal_deliverly_delivery_fee_monthly, 
      :spending_travel_flights_next_12mo => @user.spending_travel_flights_next_12mo, 
      :spending_travel_hotels_next_12mo => @user.spending_travel_hotels_next_12mo, 
      :personal_value_travel_airport_lounge_access_12mo => @user.personal_value_travel_airport_lounge_access_12mo, 
      :personal_value_concierge_service => @user.personal_value_concierge_service, 
      :spending_dining_total_monthly => @user.spending_dining_total_monthly, 
      :global_entry_boolean => @user.global_entry_boolean, 
      :tsa_pre_boolean => @user.tsa_pre_boolean, 
      :personal_value_global_entry_and_tsa_pre => @user.personal_value_global_entry_and_tsa_pre, 
      :personal_value_global_entry => @user.personal_value_global_entry, 
      :personal_value_tsa_pre => @user.personal_value_tsa_pre
    }
    p "*******************"
    p answers[:spending_total_all_credit_cards_monthly]
    card = CreditCard.first
    benefit = 0
    if 
      answers[:spending_total_all_credit_cards_monthly]*3 >= 4000
      benefit += 4000
    else 
      benefit += 2000
    end
    # find_by(card_name: "Chase Sapphire Reserve")
    cost = card.annual_fee
    p cost
    netbenefit = benefit - cost
    render json: {netbenefit: netbenefit, benefit: benefit}
    # This is what my rspec file sees:
    # answers = {netbenefit: netbenefit, benefit: benefit}
  end
  p "AFTER THE CSR COST BENEFIT METHOD"
end


#Sentence version of the answers hash:
# "How much do you generally spend on your personal credit cards combined/month?": 2300, "Could you move that full amount of spending each month onto one new credit card if it benefitted you?": true, "If no, How much of your current spending per month would you be willing to divert to this credit card?": "NA", "If you had to put a dollar value for yourself personally on getting free priority from Lyft in airport pick ups for a whole year, how much would that be worth to you in dollars? If this is something you would never spend money on, you should say zero.": 60, "How many times a month on average do you think you cancel a Lyft ride?": 0, "How many times a year do you leave something in a Lyft?": 1, "How much would you say you spend per year on meal delivery services such as Doordash, Postmates, or Grubhub?": 0, "How much would you say you spend per year on JUST DELIVERY FEES from meal delivery services such as Doordash, Postmates, or Grubhub?": 0, "How much do you plan to spend in the next 12 months on flights? If you don't have a plan, then how much do you think you've spent historically on average each year?": 4000, "How much do you plan to spend in the next 12 months on hotels?": 0, "If you had to put a dollar value for yourself personally on free luxury airport lounge access that included access to free food and beverages for a whole year, how much would that be worth to you in dollars? If this is something you would never spend money on, you should say zero.": 80, "Some question about free concierge service after I figure out what that is. If this is something you would never spend money on, you should say zero.": 0, "How much do you tend to spend per month dining out?": 450, "Do you already have Global Entry": true, "If no, do you already have TSA pre-check?": "NA", "If you don't have either yet, if you had to put a dollar value for yourself personally how much would pre-check plus global entry be worth to you in dollars if it lasted for 5 years? If this is something you would never spend money on, you should say zero.": "NA", "If you have pre-check but not global entry, how much would you pay to just get global entry?": "NA", "If you don't have either, and TSA+Global entry is worth less than $100 to you, how much is just pre-check for 5 years worth?": "NA"
