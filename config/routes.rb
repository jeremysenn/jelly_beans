Rails.application.routes.draw do
  
  resources :devices do
    collection do
      get :pos_payment
    end
  end
  
  resources :attachments do
    member do
      get :download
    end
  end
  resources :commodity_items
  resources :transactions
  resources :customers
  resources :users
  
  resources :companies
  
  resources :commodities
  
  resources :sessions
  
  get 'welcome/index'
  root 'welcome#index'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get 'signup' => 'companies#new'

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
