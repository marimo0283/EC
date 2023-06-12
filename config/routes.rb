Rails.application.routes.draw do
  root to: 'public/homes#top'

  # 顧客用
  # URL /customers/...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  scope module: :public do
    resources :items, only: [:show, :index]
    resources :cart_items, only: [:create, :index, :update, :destroy]
    delete "/cart_items/destroy_all" => "cart_items#destroy_all"
  end

  # 管理者用
  # URL /admin/...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    resources :items, only: [:new, :create, :show, :index, :edit, :update]
    resources :genres, only: [:create, :index, :edit, :update]
  end
end
