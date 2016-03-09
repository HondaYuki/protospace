Rails.application.routes.draw do
  devise_for :users
  resources :tags, param: :tag_id, only: [:index, :show]
  root 'prototypes#index'
  resources :users, only: [:show, :edit, :update]
  resources :prototypes do
    resources :likes, only:[:create, :destroy]
    resources :comments, only:[:create]
    resources :newest, only: :index
  end
end
