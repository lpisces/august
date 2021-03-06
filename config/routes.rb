August::Application.routes.draw do

  root :to =>  "home#index", :via => [:get]

  match "category/:id", :to => "category#index", :via => [:get], :as => "category"
  match "thing/:id", :to => "thing#show", :via => [:get], :as => "thing"

  mount Markitup::Rails::Engine, at: "markitup", as: "markitup"

  devise_for :users, :controllers => { :sessions => "session", :registrations => "account", :passwords => "passwords"}
  devise_scope :user do 
    get "/passwords/message" => "passwords#message"
  end

  match '/cpanel', :to => 'cpanel#index', :via => [:get]
  scope '/cpanel' do
    get '/items/get_info', :to => 'items#get_info'
    resources :settings
    resources :sections
    resources :nodes
    resources :images
    resources :items
    resources :tags
  end

end
