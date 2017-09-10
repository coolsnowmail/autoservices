Rails.application.routes.draw do
  get 'search/autoservice_search'

  resources :comments, only: [:index, :create]
  resources :moderators, only: [:show]
  resources :autoservices, only: [:index, :create, :edit, :show, :update, :destroy]
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  root 'autoservices#index'
end
