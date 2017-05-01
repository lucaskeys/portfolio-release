Rails.application.routes.draw do
  resources :portfolio_contents
  resources :blogs
  
  get 'pages/home'

  get 'pages/about'

  get 'pages/contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
