Rails.application.routes.draw do
  devise_for :users
  root to: "messages#index"
  # ユーザー編集に必要なルーティングは、editとupdateのみ
  resources :users, only: [:edit, :update]
end
