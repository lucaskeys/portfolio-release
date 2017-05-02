Rails.application.routes.draw do
  resources :portfolio_contents, except: [:show]
  get 'porfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  # uri    controller action   method for path
  resources :blogs do 
  	member do 
  		get :toggle_status
  	end
  end


  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  root to: 'pages#home'

end
