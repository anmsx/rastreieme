Rastreieme::Application.routes.draw do
  devise_for :users

  match 'about' => 'home#about'
  root  :to  => 'home#index'
end
