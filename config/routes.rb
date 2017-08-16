Rails.application.routes.draw do
  root to: 'books#index'
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :users do
    member do
      put 'like_member', to: 'books#upvote'
      put 'dislike', to: 'books#downvote'
    end

    resources :books do
      member do
        put 'like', to:    'books#upvote'
        put 'dislike', to: 'books#downvote'
        post 'borrow', to: 'books#borrow'
        post 'return', to: 'books#return'
      end
      resources :loans, only: [] do
        post 'return', to: 'loans#return'
      end
    end
  end

  resources :books, only: [:index]

  get '*path', to: redirect('/')
end
