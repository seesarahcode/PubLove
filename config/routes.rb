Rails.application.routes.draw do

  
  resources :user_steps

  root to: "home#index"

  devise_for :users, controllers: { registrations: "registrations" }
  get 'authors', to: 'publishers#authors', as: 'authors'

  resources :user_profiles, only: [:index, :new, :create, :destroy]
  get 'profile', to: 'user_profiles#show', as: 'profile'
  get 'edit_profile', to: 'user_profiles#edit', as: 'edit_profile'

  resources :books
  resources :publishers

  get 'admin/dashboard/', to: 'dashboard#admin', as: 'admin_dashboard'
  get 'super/dashboard/', to: 'dashboard#super_admin', as: 'super_admin_dashboard'
  get 'pm/dashboard/', to: 'dashboard#pm', as: 'pm_dashboard'
  get 'author/dashboard/', to: 'dashboard#author', as: 'author_dashboard'

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
