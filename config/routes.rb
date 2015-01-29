Rails.application.routes.draw do
  resources :auctions do
    collection { post :import }
  end

  root 'auctions#index'
end
