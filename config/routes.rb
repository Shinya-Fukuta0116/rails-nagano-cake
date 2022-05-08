Rails.application.routes.draw do
  #devise for customer
  #URL/customers/sign_in..

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  #devise for administrator
  #URL/admin?admin/sign_in..
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }


end
