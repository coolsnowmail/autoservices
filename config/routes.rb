Rails.application.routes.draw do
  resources :moderators
  resources :services
  resources :autoservices
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
