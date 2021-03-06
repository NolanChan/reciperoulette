Rails.application.routes.draw do
  devise_for :users, controllers: {
  }
  root to: redirect('users/dashboard')
  get 'users/roulette' => 'users#dashboard'
  post 'users/roulette' => 'users#roulette'
  post 'users/block/:id' => 'users#block'
  post 'users/unblock' => 'users#unblock'
  post 'users/set_threshold' => 'users#set_threshold'
  post 'users/save/:id' => 'users#save'
  get 'users/unblock_all' => 'users#unblock_all'
  get  'users/dashboard' => 'users#dashboard'
  post 'users/dashboard' => 'users#update'
  post 'pantries/update' => 'pantries#update'
  post 'recipes/delete_recipe' => 'recipes#delete_recipe'
  resources :ratings, only: :update
  resources :recipes
  resources :pantries do
    collection {post :sort}
  end

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
