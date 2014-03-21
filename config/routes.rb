Pocketpharma::Application.routes.draw do

  root 'static_pages#home'

  match '/help',          to: 'static_pages#help',          via: 'get'
  match '/manage',        to: 'static_pages#manage',        via: 'get'

  match '/rls_import',    to: 'static_pages#rls_import',    via: 'post'
  match '/rls_normalize', to: 'static_pages#rls_normalize', via: 'post'
  match '/medlux_import', to: 'static_pages#medlux_import', via: 'post'
  match '/dsp_update',    to: 'static_pages#dsp_update',    via: 'post'
  match '/fill_score',    to: 'static_pages#fill_score',    via: 'post'
  
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
