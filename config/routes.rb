Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :permissions
      resources :locations
      resources :messages
      resources :users
    end
  end 
end
