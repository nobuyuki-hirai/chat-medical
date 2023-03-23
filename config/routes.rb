Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :users, only: :show
  resources :rooms, only: [:index, :new, :create]

  get 'rooms/revert/:id', to: 'rooms#revert_check'
end
