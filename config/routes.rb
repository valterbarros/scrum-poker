Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'create', to: 'tasks#create', as: 'create'
  get 'index', to: 'tasks#index', as: 'tasks'
end
