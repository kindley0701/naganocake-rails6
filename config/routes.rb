Rails.application.routes.draw do


  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }
  get 'customers/edit' => 'public/customers#edit', as: 'edit_customer'
  patch 'customers' => 'public/customers#update', as: 'update_customer'
  #deviseより上にしないとroutingバグる
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }
  #controllers:{}の記述でコントローラのルーティングをデフォルトから変更してadminとcustomerで区別できるようにしている．
  #skip:[]の記述でdeviseのデフォルトの不要なルーティングを削除している．

  root to: 'public/homes#top'
  get 'about' => 'public/homes#about'
<<<<<<< HEAD
  
  #customers_controller(edit,updateはdeviseの上)
  get 'customers' => 'public/customers#show', as: 'customer'
  get 'customers/confirm' => 'public/customers#confirm', as: 'confirm_customer'
  patch 'customers/unsubscribe' => 'public/customers#unsubscribe', as: 'unsubscribe_customer'

  resources :items, module: 'public', only: [:index]
  #URLにpublicを含まないresourcesの書き方，
=======
  resources :customers, module: 'public', only: [:show, :edit, :update]
  #public権限下でのresourcesの使い方．URLに/public/を含まない．
  get 'customers/:id/confirm' => 'public/customers#confirm', as: 'confirm_customer'
  patch 'customers/:id/unsubscribe' => 'public/customers#unsubscribe', as: 'unsubscribe_customer'
>>>>>>> 9c8d00f (made page[public(customers#show, customers#edit, customers#confirm), admin(customers#index)])

  namespace :admin do
    root to: 'homes#top'
    resources :customers, only: [:index]
<<<<<<< HEAD
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show]
=======
>>>>>>> 9c8d00f (made page[public(customers#show, customers#edit, customers#confirm), admin(customers#index)])
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
