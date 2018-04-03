Rails.application.routes.draw do
  devise_for :users
  resources :tasks
  devise_scope :user do
    root to: "devise/sessions#new"
  end

  namespace :api do
    namespace :v1 do
      resources :projects, only: [] do
        collection do
          get :teamwork
        end
      end
    end
  end

  resources :rooms, only: [:index, :show, :new, :create] do
    collection do
      post 'vote'
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
