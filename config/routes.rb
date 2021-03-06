Rails.application.routes.draw do
  get "/auth/:provider/callback" => "mem#auth"
  
  post "/submit/save" => "submit#save"
  get "site/test"=> "site#test"
  


  match "/:controller(/:id)(/:action)(/:search)(.:format)", :controller =>  /admin\/[^\/]+/,id: /\d+/,via: ['get','post']
  match "/admin/:action(/:page)(/:search)(.:format)", :controller =>  "admin/home",id: /\d+/,via: ['get','post']
  
  match "/doc/:typ(/:action)(/:addition)", :controller =>  'doc',via: ['get','post']
  
  match "/:controller(/:id)(/:action)(/:search)(.:format)", :controller =>  /mem\/[^\/]+/,id: /\d+/,via: ['get','post']
  
  #match "/:controller/:action" ,via: ['get','post']

  get "/repo/new" => "repo#new"
  match "/repo/:owner/:alia(/:action)(/:oid)",controller: "repo",oid:  /\d+/,via: ['get','post']
  
  
  match "/:controller(/:id)(/:action)(/:search)(.:format)",id:  /\d+/,via: ['get','post']
  
  
  match ":action(.:format)" ,controller: 'home',via: ['get','post']
  
  match "repos/:root(/:typ)(.:format)" ,controller: 'home',action: 'repos',via: ['get','post']
   
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

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
