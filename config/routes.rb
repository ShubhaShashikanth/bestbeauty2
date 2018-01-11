Rails.application.routes.draw do
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'products#index'
  #resources :categories, only: [:index, :new, :create]
  # resources :categories, only: [:index, :new, :create]
  get '/categories/new/(:parent_id)', to: 'categories#new', as: :new_category
  resources :categories, only: [:index, :create, :show, :destroy]
  
  #get '/categories/destroy/(:parent_id)', to: 'categories#destroy', as: :destroy_category
  # get '/categories/:id', to: 'categories#show', as: :show_category

end

