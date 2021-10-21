Rails.application.routes.draw do
  resources :equipamentos
  resources :componentes
  
  get 'home/index'

  devise_for :users
  
  root to: 'equipamentos#index'

end
