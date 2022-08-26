Rails.application.routes.draw do
 
 root :to => "public/homes#top"
 get "homes/about"=>"public/homes#about", as:"about"
  
 namespace :admin do
   resources :homes
   resources :items
   resources:genres
   resources:customers
   resources:orders
   resources:order_details
 end


  namespace :public do
    resources :homes
    resources:items ,only: [:index, :show]
    resources:cart_items ,only: [:index, :update, :create, :destroy]
    get 'customers/my_page' => 'customers#show', as: "customer"
    get 'customers/information/edit' => 'customers#edit', as: "customers_edit"
    patch 'customers/information' => 'customers#update'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw'
    post 'orders/confirm', to: 'orders#confirm'
    get "orders/complete" => "orders#complete", as: "complete"
    resources:orders
    resources:addresses, only: [:index, :create, :edit, :update, :destroy]
  end

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
