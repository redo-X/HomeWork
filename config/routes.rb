Rails.application.routes.draw do


  get 'welcome/index'
  root :to => 'welcome#index'


  # REROUTE DEVISE
  devise_for :users, except: :registrations
  devise_for :users, :only => [:registrations]
  as :user do
    get 'users' => 'users/registrations#index', :as => :users
    get 'users/new' => 'users/registrations#new', :as => :new_user
    post 'users' => 'users/registrations#create'
    get 'users/:id' => 'users/registrations#edit', :as => :user

    patch 'users/:id' => 'users/registrations#update'
    put 'users/:id' => 'users/registrations#update'
    delete 'users/:id' => 'users/registrations#destroy'
  end


  resources :articles, only: [:index, :new, :create, :edit, :destroy, :update]
  resources :production_orders, only: [:index, :new, :create, :edit, :destroy, :update]
  resources :article_groups, only: [:index, :new, :create, :edit, :destroy, :update]


  #get 'products/:id' => 'catalog#view'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
