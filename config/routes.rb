Rails.application.routes.draw do
  resources :moderators
  resources :autoservices
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  root 'autoservices#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
