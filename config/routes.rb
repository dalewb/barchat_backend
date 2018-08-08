Rails.application.routes.draw do
  resources :permissions
  resources :locations
  resources :messages
  resources :users
end
