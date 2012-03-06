Rastreieme::Application.routes.draw do
  devise_for :users

  match 'tracking_numbers/multi' => 'tracking_numbers#multi'
  resources :tracking_numbers

  match 'about' => 'home#about', :as => 'about'
  root  :to  => 'home#index'
end
