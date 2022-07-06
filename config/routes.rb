Rails.application.routes.draw do

  namespace :user do
    #character
    #resources :characters
    get "test" => 'characters#create'
    #user
    get 'login' => 'users#login'
    get 'register' => 'users#register'


  end
end
