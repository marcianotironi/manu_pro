Rails.application.routes.draw do
  resources :equipamentos
  resources :componentes
  
  get 'home/index'
  post 'equipamento_create', to: 'equipamentos#create'

  devise_for :users
  root to: 'equipamentos#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
