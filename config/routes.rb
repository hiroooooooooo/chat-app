Rails.application.routes.draw do
  devise_for :users
  root to: "messages#index"
  # ユーザー編集に必要なルーティングは、editとupdateのみ
  resources :users, only: [:edit, :update]
  # 新規チャットルームの作成に必要なルーティングは、newとcreateのみ
  resources :rooms, only: [:new, :create]
end
