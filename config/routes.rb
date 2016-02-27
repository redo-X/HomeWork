Rails.application.routes.draw do

  resources :production_records
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
  resources :production_orders, only: [:index, :new, :create, :edit, :destroy, :update] do
    resources :production_work_steps, except: [:index, :show], controller: 'production_orders/production_work_steps'
    resources :production_order_attachments, except: [:index, :show], controller: 'production_orders/production_order_attachments'
    resources :production_records, only: [:index], controller: 'production_orders/production_records'
  end
  resources :article_groups, only: [:index, :new, :create, :edit, :destroy, :update]
  resources :customers, only: [:index, :new, :create, :edit, :destroy, :update]
  resources :work_plans do
    resources :work_steps, except: [:index, :show], controller: 'work_plans/work_steps'
  end

  resources :production_orders do
    put :favorite, on: :member
  end



  get 'my_production_records' => 'production_orders/production_records#my_work', :as => :my_production_records

  get 'search' => 'search#index', :as => :search

  get 'production_record_assistant' => 'production_record_assistant#index', :as => :production_record_assistant
  get 'production_record_assistant_finish' => 'production_record_assistant#finish_work', :as => :production_record_assistant_finish
  post 'production_record_assistant_finish' => 'production_record_assistant#finish_work_update'

  get 'production_record_assistant_set_production_order' => 'production_record_assistant#production_order_select'
  get 'production_record_assistant_set_production_work_step' => 'production_record_assistant#production_work_step_select'
  get 'production_record_assistant_set_work_details' => 'production_record_assistant#work_details_input'

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
