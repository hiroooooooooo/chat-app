Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  # ユーザー編集に必要なルーティングは、editとupdateのみ
  resources :users, only: [:edit, :update]
  # 新規チャットルームの作成に必要なルーティングは、newとcreateのみ
  resources :rooms, only: [:new, :create] do
    resources :messages, only: [:index, :create]
  end
end
