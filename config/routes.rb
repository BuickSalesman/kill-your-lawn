Rails.application.routes.draw do
  post "/users" => "users#create"

  post "/sessions" => "sessions#create"

  get "/plants" => "plants#index"

  get "/favorited_plants" => "favorited_plants#index"
  post "/favorited_plants" => "favorited_plants#create"
  delete "/favorited_plants/:id" => "favorited_plants#destroy"
end
