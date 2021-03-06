Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin_dashboard', as: 'rails_admin'
  devise_for :admins
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root 'home#index'

  #customization step 1
  match 'welcome/basic-info'=> 'customization/basic#step_basic_info', :as => :welcome_step1 , :via => :get
  match 'welcome/basic-info'=> 'customization/basic#save_basic_info', :as => :save_step1 , :via => :post

  #customization step 2
  match 'welcome/your-soccer-skills'=> 'customization/skills#step_basic_skills', :as => :basic_skills_step2 , :via => :get

  #user badges
  match 'my-badges'=> 'users/badges#index', :as => :user_badges , :via => :get

  #user activity log
  match 'my-activities'=> 'users/activities#index', :as => :user_activities , :via => :get

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
