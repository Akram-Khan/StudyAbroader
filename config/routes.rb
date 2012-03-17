StudyAbroaderSlideshow::Application.routes.draw do

  mount Rich::Engine => '/rich', :as => 'rich'

  get "destinations/index"

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users do
    get "signup", :to => "registrations#new"
    get "signin", :to => "sessions#new"
    post "signin", :to => "sessions#new"
    get "signout", :to => "devise/sessions#destroy"
  end

  match "/about", :to => "home#about"
  match "/contact", :to => "home#contact"
  match "/privacy_policy", :to => "home#privacy_policy"
  match "/terms_and_conditions", :to => "home#terms_and_conditions"
  match "/scholarships_and_contests", :to => "home#scholarships_and_contests"

  resources :destinations do
    member do
      get :photos
      get :videos
      get :topic
      get :blog
      get :destination_map
      get :fun_facts
    end
    resources :destination_photos
    resources :destination_videos
  end


  resources :program_providers

  match "dashboard" => "dashboard#my_blogging_abroad"
  match 'dashboard/about_me' => 'dashboard#about_me'
  match 'dashboard/edit_profile' => 'dashboard#edit_profile'
  match 'dashboard/my_blogging_abroad' => "dashboard#my_blogging_abroad"
  match 'dashboard/my_forum_activity' => 'dashboard#forum_participation'
  match "/search", :to => "home#search"

  #match "/search", :to => "topics#search"

  match 'topics/display_topics_by_country' => 'topics#display_topics_by_country'


  #match 'forums/list_topics_by_country' => 'forums#list_topics_by_country'

  devise_for :users, :controllers => {:sessions => "sessions", :passwords => "passwords", :registrations => "registrations"}

  resources :users do
    member do
      get :user_home
    end
    resources :submissions
    member do
      get :following,:followers
    end
    resources :blocklists, :only => [:new]
  end

  resources :blogs do
    resources :blogcomments
  end

  resources :relationships, :only => [:create,:destroy]
 
 
 
  resources :submissions

  resources :admin_messagings


  resources :forums, :only => [:index,:show] do
    member do
      get :list_topics_by_country
    end
    resources :topics do
       member do
        post :vote_up
        post :vote_down
        
      end
    end
  end

  resources :topics do
    resources :posts do
      member do
        post :vote_down
        post :vote_up
      end
    end
  end
  
  resources :post do
    resources :postcomments
  end

  resources :messages
  resources :conversations, :only => [:index, :new, :show]

  get "admin_messagings/create"


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
