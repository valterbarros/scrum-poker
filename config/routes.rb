Rails.application.routes.draw do
  devise_for :users
  resources :tasks
  resources :session_vote
  devise_scope :user do
    root to: "devise/sessions#new"
  end
  
  resources :rooms, only: [:index, :show, :new, :create] do
    
    collection do
      post 'vote'
      delete 'remove_user'
    end

    collection do
      get 'join/:token', to: 'rooms#join', as: :join
    end
  end

  resources :invites, only: [:create] do
    collection do
      get 'reload_users'
    end
  end
end
