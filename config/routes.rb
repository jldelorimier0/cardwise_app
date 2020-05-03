Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/credit_cards" => "credit_cards#index"
    post "/credit_cards" => "credit_cards#create"
  end
end
