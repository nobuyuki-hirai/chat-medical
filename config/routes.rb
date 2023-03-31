Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :users, only: [:show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
  end  
  resources :rooms do
    resources :messages, only: [:show, :create]
  end

  get 'rooms/revert/:id', to: 'rooms#revert_check'
end
