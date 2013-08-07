August::Application.routes.draw do


  root :to =>  "home#index"

  
  devise_for :users, :controllers => { :sessions => "session", :registrations => "account", :passwords => "passwords"}

  devise_scope :user do 
    get "/passwords/message" => "passwords#message"
  end

  match '/cpanel', :to => 'cpanel#index', :via => [:get]
  scope '/cpanel' do
    resources :settings
    resources :sections
    resources :nodes
    resources :images
    resources :items
  end

end
