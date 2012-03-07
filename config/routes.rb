Rastreieme::Application.routes.draw do
  devise_for :users

  match 'tracking_numbers/multi' => 'tracking_numbers#multi'
  match 'tracking_numbers/list' => 'tracking_numbers#list', :as => 'list_tracking_numbers'
  resources :tracking_numbers do
    member do
      get 'status', :as => 'status'
    end
  end

  match 'about' => 'home#about', :as => 'about'
  root  :to  => 'home#index'
end
