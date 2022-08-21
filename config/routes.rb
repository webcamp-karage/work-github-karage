Rails.application.routes.draw do

 #namespace :admin do
   resources :sessions, :homes, :items, :genres, :customers, :orders, :order_details
 end


  namespace :public do
    resources :homes, :items, :registrations, :sessions, :customers, :cart_itmes, :orders, :addresses

  end

  devise_for :customers
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
