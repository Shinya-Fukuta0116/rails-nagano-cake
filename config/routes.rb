Rails.application.routes.draw do

  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
  end
  namespace :admin do
    root 'homes#top'
    get "about"=> "homes#about"
    get 'orders/show'
    get 'orders/update'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
  end
  #devise for administrator
  #URL/admin?admin/sign_in..
  devise_for :admin, skip: [:passwords] ,controllers: {

    sessions: "admin/sessions"
  }

  #devise for customer
  #URL/customers/sign_in..

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

end
