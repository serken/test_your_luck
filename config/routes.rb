Rails.application.routes.draw do
  scope :protocol => 'https://', :constraints => { :protocol => 'https://' } do
    devise_for :users
    root to: "home#index"

    get '/profile', to: 'profiles#index'
    get '/profile/edit', to: 'profiles#edit'
    get '/profile/show_profile', to: 'profiles#show_profile'
    get '/profile/wallets', to: 'profiles#wallets'
    get '/profile/deposit', to: 'profiles#deposit'
    get '/profile/withdraw', to: 'profiles#withdraw'
    post '/profile/update_profile', to: 'profiles#update_profile'

    post '/profile/make_deposit', to: 'profiles#make_deposit'
    post '/profile/make_withdraw', to: 'profiles#make_withdraw'

    post '/prepare_payment', to: 'profiles#prepare_payment'

    resources :deals do
      post 'accept_deal', to: 'deals#accept_deal'
    end
  end
end
