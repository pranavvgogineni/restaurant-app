Rails.application.routes.draw do
  post "/users" => "users#create"
  post "/sessions" => "sessions#create"
  get "/saved_searches" => "saved_searches#index"
  post "/saved_searches" => "saved_searches#create"
  get "/saved_searches/:id" => "saved_searches#show"
  patch "/saved_searches/:id" => "saved_searches#update"
  delete "/saved_searches/:id" => "saved_searches#destroy"
  patch "/users/:id" => "users#update"
  post "/searches" => "searches#index"
end
