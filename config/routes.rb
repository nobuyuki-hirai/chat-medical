Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :users, only: [:show, :edit, :update] do
    resources :relationships, only: [:index, :create, :destroy]
    resources :talks, only: [:index, :create]
  end
  resources :rooms do
    resources :messages, only: [:show, :create]
    resources :events do
      resources :event_participates, only: [:create, :destroy]
    end
  end

  get 'rooms/revert/:id', to: 'rooms#revert_check'
end
