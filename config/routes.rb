Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :users, only: [:show, :edit, :update] do
    resources :relationships, only: [:index, :create, :destroy]
  end
  resources :rooms do
    resources :messages, only: [:show, :create]
    resources :events, only: [:index, :new, :create]
  end

  get 'rooms/revert/:id', to: 'rooms#revert_check'
end
