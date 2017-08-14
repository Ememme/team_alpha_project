Rails.application.routes.draw do
  root to: 'books#index'
  devise_for :users

  resources :users do
    resources :books
  end

  get '*path', to: redirect('/')
end
