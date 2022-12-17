Rails.application.routes.draw do
  
  root to: 'public/homes#top'
  
  devise_for :end_users, controllers: {
   sessions:      'public/sessions',
   passwords:     'public/passwords',
   registrations: 'public/registrations'
  }
  
  scope module: :public do
   get 'end_users/mypage', :to => "end_users#show"
   patch 'end_users/mypage', :to => "end_users#update"
   get 'end_users/mypage/edit', :to => "end_users#edit"
   get 'end_users/mypage/confirm', :to => "end_users#confirm"
   patch 'end_users/mypage/unsubscribe', :to => "end_users#unsubscribe"
   get 'end_users/mypage/addresses', :to => "addresses#index"
   post 'end_users/mypage/addresses', :to => "addresses#create"
   get 'end_users/mypage/orders', :to => "orders#index"
   get 'items', :to => "items#index", as: :items
   get 'item/:id', :to => "items#show", as: :item
   get 'cart_items', :to => "cart_items#index"
   post 'cart_items', :to => "cart_items#create"
   patch 'cart_items/:id', :to => "cart_items#update" , as: :cart_item
   delete 'cart_items/:id', :to => "cart_items#destroy"
   delete 'cart_items', :to => "cart_items#destroy_all" , as: :destroy_all
   post 'orders', :to => "orders#create", as: :orders 
   get 'orders/new', :to => "orders#new", as: :orders_new
   post 'orders/confirm', :to => "orders#confirm", as: :orders_confirm
   get 'orders/done', :to => "orders#done", as: :orders_done
   
   
   
  end
  
  devise_for :admins,  path: 'admin', controllers: {
   sessions:      'admin/sessions',
   passwords:     'admin/passwords'
  }
  
  namespace :admin do
   get '', :to => "homes#top"
   get 'customers/index', :to => "customers#index"
   get 'genres', :to => "genres#index"
   post 'genres', :to => "genres#create"
   patch 'genres/:id', :to => "genres#update", as: :genres_update
   get 'genres/:id/edit', :to => "genres#edit" , as: :genres_edit
   get 'items', :to => "items#index"
   get 'items/new', :to => "items#new"
   post 'items/new', :to => "items#create"
   get 'items/:id', :to => "items#show", as: :item
   patch 'items/:id', :to => "items#update"
   get 'items/:id/edit', :to => "items#edit", as: :item_edit
   get 'orders', :to => "orders#index", as: :orders
   get 'orders/:id', :to => "orders#show", as: :order
   patch 'orders/:id', :to => "orders#update"
   patch 'order_details/:id', :to => "order_details#update", as: :order_detail
 
  end

end
