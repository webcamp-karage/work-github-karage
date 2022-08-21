Rails.application.routes.draw do
<<<<<<< HEAD

 #namespace :admin do
   resources :sessions, :homes, :items, :genres, :customers, :orders, :order_details
=======
 namespace :admin do
   resources :homes
   resources :items
   resources:genres
   resources:customers
   resources:orders
   resources:order_details
>>>>>>> origin/develop
 end


  namespace :public do
<<<<<<< HEAD
    resources :homes, :items, :registrations, :sessions, :customers, :cart_itmes, :orders, :addresses

=======
    resources :homes
    resources:items
    resources:customers
    resources:cart_itmes
    resources:orders
    resources:addresses
>>>>>>> origin/develop
  end

  devise_for :customers
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
