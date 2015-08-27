Rails.application.routes.draw do
  resources :groups
  resources :pages
  devise_for :users

  #root 'profiles#index'

  devise_scope :user do
    authenticated :user do
      root 'profiles#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/registrations#new', as: :unauthenticated_root
    end
  end

  resources :profiles  do
    member do
      post 'update_quote'
    end

    resources :posts
    resources :activities do
      member do
        get 'like'
        get 'unlike'
        get 'shared'
      end
    end
  end

  resources :friends do
    collection do
      get 'pending'
    end
  end

  resources :after_register
  # resources :conversations, only: [:index, :show, :destroy] do
  #   member do
  #     post :reply
  #     post :restore
  #     post :mark_as_read
  #   end
  #   collection do
  #     delete :empty_trash
  #   end
  # end
  resources :messages
  resources :photos
  resources :albums
  resources :songs
  resources :conversations do
    member do
      post :reply
      post :restore
      post :mark_as_read
    end
  end
  concern   :user_comments,  TheComments::UserRoutes.new
  concern   :admin_comments, TheComments::AdminRoutes.new
  resources :comments, concerns:  [:user_comments, :admin_comments] do
    member do
      get 'like'
      get 'unlike'
    end
  end
end
