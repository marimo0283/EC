Rails.application.routes.draw do
  root to: "public/homes#top"
  get "/about", to: "public/homes#about"

  # 顧客用
  # URL /customers/...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  scope module: :public do
    resources :delivery_addresses, only: [:create, :index, :edit, :update, :destroy]
    resources :items, only: [:show, :index]
    resources :cart_items, only: [:create, :index, :update, :destroy]
    delete "/cart_items/destroy_all", to: "cart_items#destroy_all"
    resources :orders, only: [:new, :create, :index, :show]
    get "/orders/comfirm", to: "order#/comfirm"
    get "/orders/complete", to: "orders#complete"
    get "/customers/my_page", to: "customers#show"
    get "/customers/information/edit", to: "customers#edit"
    patch "/customers/information", to: "customers#update"
    get "/customers/quit", to: "customers#quit"
    patch "/customers/out", to: "customers#out"
  end

  # 管理者用
  # URL /admin/...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    resources :items, only: [:new, :create, :show, :index, :edit, :update]
    resources :genres, only: [:create, :index, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
  end
end
