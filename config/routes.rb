Rails.application.routes.draw do


  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }
  #controllers:{}の記述でコントローラのルーティングをデフォルトから変更してadminとcustomerで区別できるようにしている．
  #skip:[]の記述でdeviseのデフォルトの不要なルーティングを削除している．

  root to: 'public/homes#top'
  get 'about' => 'public/homes#about'

  get 'customers' => 'public/customers#show', as: 'customer'
  get 'customers/edit' => 'public/customers#edit', as: 'edit_customer'
  patch 'customers' => 'public/customers#update', as: 'update_customer'

  namespace :admin do
    root to: 'homes#top'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
