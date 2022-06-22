Rails.application.routes.draw do
  devise_for :admin, skip: [:passwords] ,controllers: {

    sessions: "admin/sessions"
  }
  #devise for customer
  #URL/customers/sign_in..

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  root to: 'public/homes#top'

  namespace :admin do
    root to: "homes#top"
    resources :orders, only: [:index, :show, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    patch "order_details/:id" => "orders#order_detail_update", as:"order_detail_update"
  end

  scope module: :public do
    get "about"=> "homes#about"
    get "customers/my_page" => "customers#show"
    get "customers/my_page_edit" => "customers#edit"
    patch "customers/my_page_update" => "customers#update"
    get "unsubscribe"=> "customers#unsubscribe"
    get 'orders/thanks'
    post 'orders/confirm'
    patch "withdraw"=> "customers#withdraw"
    delete 'destroy_all'=> "cart_items#destroy_all"
    resources :orders, only: [:new, :index, :show, :create]
    resources :addresses, only: [:index, :edit, :update, :create, :destroy]
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :update, :create, :destroy]

  end
end
