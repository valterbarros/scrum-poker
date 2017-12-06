Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tasks
  devise_scope :user do
    root to: "devise/sessions#new"
  end
  resources :rooms, only: [:index, :show] do
    member do
      post 'vote/:card_id/task/:task_id/step/:step_id', to: 'rooms#vote', as: 'vote'
    end
    collection do
      post 'join/:token', to: 'rooms#join', as: :join
    end
  end
  resources :invites, only: [:create]
end
