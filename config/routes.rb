Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :users, only: :show
  resources :rooms

  get 'rooms/revert/:id', to: 'rooms#revert_check'
end
