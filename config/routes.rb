Rastreieme::Application.routes.draw do
  devise_for :users

  resources :tracking_numbers

  match 'about' => 'home#about', :as => 'about'
  root  :to  => 'home#index'
end
