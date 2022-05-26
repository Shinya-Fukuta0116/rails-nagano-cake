Rails.application.routes.draw do

  namespace :pbulic do
    get 'items/index'
    get 'items/update'
    get 'items/create'
    get 'items/destroy'
    get 'items/destroy_all'
  end
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
    root to:"homes#top"
    get 'orders/show'
    get 'orders/update'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
  end

  namespace :public do
    get "about"=> "homes#about"
    get "customers/my_page" => "customers#show"
    get "unsubscribe"=> "customers#unsubscribe"
    get 'orders/confirm'
    get 'orders/thanks'
    patch "withdraw"=> "customers#withdraw"
    resource :customers, only: [:show, :edit, :update]
    resources :orders, only: [:new, :index, :show, :create]
    resources :addresses, only: [:index, :edit, :update, :create, :destroy]

  end
end
