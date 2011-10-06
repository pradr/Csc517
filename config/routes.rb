Project1::Application.routes.draw do
  get "comments/new"
  get "sessions/new"

  resources :users, :only => [:new, :create, :destroy]
  resources :sessions, :only => [:new, :create, :destroy]
  resources :microposts, :only => [:create, :destroy, :vote]
  resources :comments, :only => [:create, :destroy]
  resources :votes, :only => [:create, :vote_comments]

  match '/signup',  :to => 'users#new'
  match '/signin',  :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
#  match '/microposts', :to => 'microposts#new'
  match '/comments', :to => 'comments#new'
  match '/votes', :to => 'votes#create'

#  match '/users/create_admin', :to => UsersController.create_admin("id")
  #
  match 'users/create_admin', :to =>'users#create_admin'

  resources :pages do
            collection do
            post :search
            post :home
            end
  end

  resources :users do
            collection do
            post :create_admin
            end
  end

  get "pages/home"
  get "users/new"
  get "microposts/new"
  get "votes/new"

#  get 'users/:id', :as => 'user', :to => 'users#user'



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
  root :to => 'pages#home'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
