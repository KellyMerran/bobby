BobbyStore::Application.routes.draw do
  
  devise_for :users
  
  # root to: "item_groups#index"

  devise_scope :user do
    root to: "item_groups#index" 
  end

  resources :clients, only: [:new, :create, :index, :edit, :update]
  get 'clients/:client_id/terms' => 'clients#terms', as: 'terms_conditions'
  get 'clients/:client_id/terms_approval' => 'clients#terms_approval', as: 'terms_approval'

  resources :item_groups, only: [:new, :create, :index]
  resources :items, only: [:show, :update]
  get 'item_groups/add_item' => 'item_groups#add_item', as: 'add_item'
  get 'clients/:client_id/item_groups/new' => 'item_groups#add_group_only', as: 'add_group_to_client'

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
