Rails.application.routes.draw do
  root to: 'books#index'
  devise_for :users

  resources :users do
    member do
      put 'like', to: 'links#upvote'
      put 'dislike', to: 'links#downvote'
    end

    resources :books do
      member do
        put "like", to:    "books#upvote"
        put "dislike", to: "books#downvote"
      end
    end
  end

  get '*path', to: redirect('/')
end
