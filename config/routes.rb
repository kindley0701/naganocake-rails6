Rails.application.routes.draw do

  namespace :admin do
    get 'orders/show'
  end
  namespace :public do

  end
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

  #customers_controller(edit,updateはdeviseの上)
  get 'customers' => 'public/customers#show', as: 'customer'
  get 'customers/confirm' => 'public/customers#confirm', as: 'confirm_customer'
  patch 'customers/unsubscribe' => 'public/customers#unsubscribe', as: 'unsubscribe_customer'

  resources :items, module: 'public', only: [:index, :show]

  resources :cart_items, module: 'public', only: [:index, :create, :destroy, :update]
  delete 'cart_items' => 'public/cart_items#destroy_all', as: 'all_cart_items'

  resources :addresses, module: 'public', only: [:index, :create, :edit, :update, :destroy]

  resources :orders, module: 'public', only: [:new, :index, :show, :create]
  get 'orders/confirm' => 'public/orders#confirm', as: 'confirm_order'
  get 'orders/complete' => 'public/orders#complete', as: 'complete_order'


  namespace :admin do
    root to: 'homes#top'
    resources :customers, only: [:index]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
