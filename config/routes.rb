Rails.application.routes.draw do

  namespace :user do
    #character
    resources :characters
    #movies
    resources :movies
    #user
    get 'login' => 'users#login'
    get 'register' => 'users#register'


  end
end
