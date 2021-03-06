Rails.application.routes.draw do

  resources :topics, only: [:index, :show]
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :portfolio_contents, except: [:show] do
    put :sort, on: :collection
  end
  get 'angular-items', to: 'portfolio_contents#angular'
  get 'portfolio/:id', to: 'portfolio_contents#show', as: 'portfolio_show'
  get 'portfolios', to: 'portfolio_contents#index', as: 'portfolios'
  # uri    controller action   method for path
  resources :blogs do 
  	member do 
  		get :toggle_status
  	end
  end


  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  mount ActionCable.server => '/cable'
  
  root to: 'pages#home'

end
