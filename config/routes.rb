PersuadirPe::Application.routes.draw do

  resources :event_dates

  resources :archives

  resources :consultants
  get "consultants_list" => "consultants#consultants_list", :as => "consultants_list"

  resources :notices do
    resources :images
  end

  resources :images

  resources :slides do
    resources :images
  end

  #devise_for :users #, :controllers => { :registrations => 'registrations'}
  # devise_for :users
  devise_for :user, :path => '', :path_names => { :sign_in => "log_in"}
  resources :users, :only => [:index, :new, :edit, :update, :destroy, :create]

  resources :pages do
    member do
      put 'up'
      put 'down'
    end
  end

  get "home/index"

  resources :workshops do
    resources :event_dates
  end

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
  # match ':controller(/:action(/:id))(.:format)'
end
