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
  def chase_sapphire_reserve_cost_benefit_analysis
  end
end
