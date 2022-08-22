Rails.application.routes.draw do
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
    resources:items
    resources:customers
    resources:cart_itmes
    resources:orders
    resources:addresses
  end

  devise_for :customers
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
