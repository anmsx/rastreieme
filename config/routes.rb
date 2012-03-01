Rastreieme::Application.routes.draw do
  devise_for :users

  match 'about' => 'home#about', :as => 'about'
  root  :to  => 'home#index'
end
