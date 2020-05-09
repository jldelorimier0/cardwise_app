Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    post "/users" => "users#create"
    get "/credit_cards" => "credit_cards#index"
    post "/credit_cards" => "credit_cards#create"
    post "/calculate_cost_benefit" => "credit_cards#chase_sapphire_reserve_cost_benefit_analysis"
  end
end
