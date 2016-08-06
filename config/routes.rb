Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  get '/profile', to: 'profiles#index'
  get '/profile/edit', to: 'profiles#edit'
  get '/profile/wallets', to: 'profiles#wallets'
  get '/profile/deposit', to: 'profiles#deposit'
  get '/profile/withdraw', to: 'profiles#withdraw'
end
