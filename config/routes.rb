Rails.application.routes.draw do
  post "/users" => "users#create"
  post "/sessions" => "sessions#create"
  get "/saved_searches" => "saved_searches#index"
  post "/saved_searches" => "saved_searches#create"
end
