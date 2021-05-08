Rails.application.routes.draw do

  get 'searches/search'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
  }

  root to: 'homes#top'

  get "/home/about" => "homes#about"

  resources :users do
  resource :relationships, only: [:create, :destroy]
  get 'followings' => 'relationships#followings', as: 'followings'
  get 'followers' => 'relationships#followers', as: 'followers'
end

  resources :books do
  resource :favorites, only: [:create, :destroy]
  resources :book_comments, only: [:create, :destroy]

  end

  get '/search', to: 'searches#search'

end