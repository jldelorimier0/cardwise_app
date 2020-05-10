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
    user = User.create!(
      name: "fake",
      email: "fake@gmail.com",
      password: "password",
      spending_total_all_credit_cards_monthly: 2300,
      spending_amount_movable_monthly: true, 
      # spending_willing_to_change_credit_cards_monthly: "na", 
      spending_lyft_total_monthly: 0,
      #80 
      personal_value_lyft_priority_airport_pickup_12mo: 60, 
      personal_value_lyft_cancel_ride_times_monthly: 0, 
      personal_value_lyft_lose_something_times_12mo: 1, 
      spending_meal_deliverly_total_monthly: 0, 
      spending_meal_deliverly_delivery_fee_monthly: 0, 
      spending_travel_flights_next_12mo: 800, 
      #4000
      spending_travel_hotels_next_12mo: 0, 
      personal_value_travel_airport_lounge_access_12mo: 80, 
      personal_value_concierge_service: 0, 
      spending_dining_total_monthly: 450, 
      global_entry_boolean: true, 
      # tsa_pre_boolean: "na", 
      # personal_value_global_entry_and_tsa_pre: "na", 
      # personal_value_global_entry: "na", 
      # personal_value_tsa_pre: "na"
    )
    p "*********PRINTING THE USER**********"
    p user
    p "*********PRINTING USER'S ANSWERS**********"
    answers = { 
      :spending_total_all_credit_cards_monthly => user.spending_total_all_credit_cards_monthly,
      :spending_amount_movable_monthly => user.spending_amount_movable_monthly, 
      :spending_willing_to_change_credit_cards_monthly => user.spending_willing_to_change_credit_cards_monthly, 
      :spending_lyft_total_monthly => user.spending_lyft_total_monthly, 
      :personal_value_lyft_priority_airport_pickup_12mo => user.personal_value_lyft_priority_airport_pickup_12mo, 
      :personal_value_lyft_cancel_ride_times_monthly => user.personal_value_lyft_cancel_ride_times_monthly, 
      :personal_value_lyft_lose_something_times_12mo => user.personal_value_lyft_lose_something_times_12mo, 
      :spending_meal_deliverly_total_monthly => user.spending_meal_deliverly_total_monthly, 
      :spending_meal_deliverly_delivery_fee_monthly => user.spending_meal_deliverly_delivery_fee_monthly, 
      :spending_travel_flights_next_12mo => user.spending_travel_flights_next_12mo, 
      :spending_travel_hotels_next_12mo => user.spending_travel_hotels_next_12mo, 
      :personal_value_travel_airport_lounge_access_12mo => user.personal_value_travel_airport_lounge_access_12mo, 
      :personal_value_concierge_service => user.personal_value_concierge_service, 
      :spending_dining_total_monthly => user.spending_dining_total_monthly, 
      :global_entry_boolean => user.global_entry_boolean, 
      :tsa_pre_boolean => user.tsa_pre_boolean, 
      :personal_value_global_entry_and_tsa_pre => user.personal_value_global_entry_and_tsa_pre, 
      :personal_value_global_entry => user.personal_value_global_entry, 
      :personal_value_tsa_pre => user.personal_value_tsa_pre
    }
    p "********DOES THIS PRINT THEIR ANSWERS AGAIN? no, you're printing them first below, silly.***********"
    p answers
    p "*******************"
    # p answers[:spending_total_all_credit_cards_monthly]
    card = CreditCard.first
    benefit = 0
    user_monthly_spending = answers[:spending_total_all_credit_cards_monthly]
    user_annual_spending = user_monthly_spending*12
    user_travel_spending_annual_simple = answers[:spending_lyft_total_monthly]*12 + answers[:spending_travel_flights_next_12mo] + answers[:spending_travel_hotels_next_12mo]
    p "The user_monthly_spending variable is $#{user_monthly_spending}"
    p "The user_annual_spending variable is $#{user_annual_spending}"
    p "The user_travel_spending_annual_simple variable is $#{user_travel_spending_annual_simple}"

    if user_travel_spending_annual_simple >= 300
      benefit += 300
      user_travel_spending_annual_simple -= 300
      p "Adding $300 to benefits for travel credit; subtracting $300 from total annual travel spending for future benefit analysis."
    elsif user_travel_spending_annual_simple <300
      benefit += user_travel_spending_annual_simple
      user_travel_spending_annual_simple -= user_travel_spending_annual_simple
      p "Adding #{user_travel_spending_annual_simple} to benefits for travel credit; subtracting $#{user_travel_spending_annual_simple} from total annual travel spending for future benefit analysis."
    else
    end
    p "The user_travel_spending_annual_simple variable is now $#{user_travel_spending_annual_simple}"
    p "The benefit to the user is now #{benefit}."
    if user_monthly_spending * 3 >= 4000
      if user_travel_spending_annual_simple >= 750
        benefit+=750
        user_travel_spending_annual_simple -= 750
        p "Adding $750 to benefits for travel credit; subtracting $750 from total annual travel spending for future benefit analysis."
      elsif user_travel_spending_annual_simple < 750
        p "Adding #{user_travel_spending_annual_simple} to benefit"
        benefit += user_travel_spending_annual_simple
        p "The benefit is now #{benefit}"
        fiveHundredDividedByOnePointFive = user_travel_spending_annual_simple/1.5
        p "fiveHundredDividedByOnePointFive = #{user_travel_spending_annual_simple/1.5}"
        leftover_points_after_used_for_travel = card.sign_on_bonus_points - (user_travel_spending_annual_simple/1.5)*100
        p "You have #{leftover_points_after_used_for_travel} points left from your sign-on bonus after using the rest of them on travel."
        p "Subtracting $#{user_travel_spending_annual_simple} from the user_travel_spending_annual_simple variable."
        user_travel_spending_annual_simple -= user_travel_spending_annual_simple
        p "Adding $#{leftover_points_after_used_for_travel/100} to your benefit for cash back after using the rest of your sign-on bonus points towards travel."
        benefit += leftover_points_after_used_for_travel/100
      else
      end
    else
      #you get no sign on bonus, so nothing happens.
    end
    p "The user_travel_spending_annual_simple variable is now $#{user_travel_spending_annual_simple}."
    p "The benefit to the user is now $#{benefit}."



    #THE METHOD BELOW IS INCORRECT. You don't get a $300 credit for a $4000 spending in 3 months. You've conflated two different benefits here.
    # if 
    #   user_monthly_spending*3 >= 4000 
    #   if user_travel_spending_annual_simple >= 300
    #     benefit+=300 
    #     p "Adding $300 to benefits for travel credit"
    #   elsif user_travel_spending_annual_simple
    #     benefit+=user_travel_spending_annual_simple
    #     p "Adding #{user_travel_spending_annual_simple} to benefits for travel credit"
    #   end
    # else 
    # end
    #THE FIND_BY LINE BELOW IS SUPPOSED TO BE COMMENTED OUT... IT'S GIVING ME AN ERROR AND I THINK HAS A SYNTAX ISSUE AND SEEMS TO NOT BE NEEDED.
    # find_by(card_name: "Chase Sapphire Reserve")
    cost = card.annual_fee
    p "THE CURRENT BENEFIT IS $#{benefit}"
    p "THE COST IS $#{cost}"
    netbenefit = benefit - cost
    render json: {netbenefit: netbenefit, benefit: benefit}
    # This is what my rspec file sees:
    # answers = {netbenefit: netbenefit, benefit: benefit}
  end
  p "AFTER THE CSR COST BENEFIT METHOD"
end


#Sentence version of the answers hash:
# "How much do you generally spend on your personal credit cards combined/month?": 2300, "Could you move that full amount of spending each month onto one new credit card if it benefitted you?": true, "If no, How much of your current spending per month would you be willing to divert to this credit card?": "NA", "If you had to put a dollar value for yourself personally on getting free priority from Lyft in airport pick ups for a whole year, how much would that be worth to you in dollars? If this is something you would never spend money on, you should say zero.": 60, "How many times a month on average do you think you cancel a Lyft ride?": 0, "How many times a year do you leave something in a Lyft?": 1, "How much would you say you spend per year on meal delivery services such as Doordash, Postmates, or Grubhub?": 0, "How much would you say you spend per year on JUST DELIVERY FEES from meal delivery services such as Doordash, Postmates, or Grubhub?": 0, "How much do you plan to spend in the next 12 months on flights? If you don't have a plan, then how much do you think you've spent historically on average each year?": 4000, "How much do you plan to spend in the next 12 months on hotels?": 0, "If you had to put a dollar value for yourself personally on free luxury airport lounge access that included access to free food and beverages for a whole year, how much would that be worth to you in dollars? If this is something you would never spend money on, you should say zero.": 80, "Some question about free concierge service after I figure out what that is. If this is something you would never spend money on, you should say zero.": 0, "How much do you tend to spend per month dining out?": 450, "Do you already have Global Entry": true, "If no, do you already have TSA pre-check?": "NA", "If you don't have either yet, if you had to put a dollar value for yourself personally how much would pre-check plus global entry be worth to you in dollars if it lasted for 5 years? If this is something you would never spend money on, you should say zero.": "NA", "If you have pre-check but not global entry, how much would you pay to just get global entry?": "NA", "If you don't have either, and TSA+Global entry is worth less than $100 to you, how much is just pre-check for 5 years worth?": "NA"


# a User will have:
      # spending_total_all_credit_cards_monthly
      # spending_amount_movable_monthly 
      # spending_willing_to_change_credit_cards_monthly 
      # spending_lyft_total_monthly 
      # personal_value_lyft_priority_airport_pickup_12mo 
      # personal_value_lyft_cancel_ride_times_monthly 
      # personal_value_lyft_lose_something_times_12mo 
      # spending_meal_deliverly_total_monthly 
      # spending_meal_deliverly_delivery_fee_monthly 
      # spending_travel_flights_next_12mo 
      # spending_travel_hotels_next_12mo 
      # personal_value_travel_airport_lounge_access_12mo 
      # personal_value_concierge_service 
      # spending_dining_total_monthly 
      # global_entry_boolean 
      # tsa_pre_boolean 
      # personal_value_global_entry_and_tsa_pre 
      # personal_value_global_entry 
      # personal_value_tsa_pre