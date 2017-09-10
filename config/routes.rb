Rails.application.routes.draw do
  get 'search/autoservice_search'

  resources :comments
  resources :moderators
  resources :autoservices
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  root 'autoservices#index'
end
