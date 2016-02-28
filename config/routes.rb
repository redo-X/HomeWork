Rails.application.routes.draw do

  get 'welcome/index'
  root :to => 'welcome#index'


  # REROUTE DEVISE
  devise_for :users, except: :registrations
  devise_for :users, :only => [:registrations]
  as :user do
    get 'users' => 'registrations#index', :as => :users
    get 'users/new' => 'registrations#new', :as => :new_user
    post 'users' => 'registrations#create'
    get 'users/:id' => 'registrations#edit', :as => :user

    patch 'users/:id' => 'registrations#update'
    put 'users/:id' => 'registrations#update'
    delete 'users/:id' => 'registrations#destroy'
  end


  resources :articles, only: [:index, :new, :create, :edit, :destroy, :update]
  resources :production_orders, only: [:index, :new, :create, :edit, :destroy, :update] do
    resources :production_work_steps, except: [:index, :show], controller: 'production_orders/production_work_steps'
    resources :production_records, only: [:index], controller: 'production_orders/production_records'
    resources :production_order_attachments, except: [:index, :show], controller: 'production_orders/production_order_attachments'
  end
  resources :article_groups, only: [:index, :new, :create, :edit, :destroy, :update]
  resources :customers, only: [:index, :new, :create, :edit, :destroy, :update]
  resources :work_plans, except: [:show] do
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

end
