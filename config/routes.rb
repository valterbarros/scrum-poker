Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tasks
  devise_scope :user do
    root to: "devise/sessions#new"
  end
  resources :rooms, only: [:index]
end
