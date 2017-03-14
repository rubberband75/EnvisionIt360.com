Rails.application.routes.draw do
  
  root 'pages#home'
  
  get 'asdf' => redirect('stuff/stuff.html')
  
  get 'signup'  => 'users#new' 
  resources :users
  
  get 'users' => 'users#index'
  get 'users/:id' => 'users#show'

  get 'create-house' => 'houses#new'
  get '/houses' => 'houses#index'
  resources :houses
  
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'logout' => 'sessions#destroy'
  
  get '/unreal' => 'webplayers#index'
  
  post '/' => 'sessions#create'
  
  get 'dashboard' => 'pages#dashboard'
  
  get 'index' => 'pages#index'
  get '/my-houses' => 'builder#houses'
  get '/my-customers' => 'builder#customers'
  get '/my-customers/:id' => 'builder#customer_info'
  get '/my-options' => 'builder#options'
  
  #patch '/my-customers/:id' => 'pages#edit_customer'
  #put '/my-customers/:id' => 'pages#edit_customer'
  
  resources :options
  get 'all-users' => 'admin#users'
  get 'all-houses' => 'admin#houses'
  get 'all-options' => 'admin#options'
  
  get 'highscore' => 'unity#highscore'
  get 'highscoreUpdate' => 'unity#highscoreUpdate'
  get 'optionsJSON' => 'unity#optionsJSON'
  
  get 'houseName' => 'unity#houseName'
  get 'houseNameUpdate' => 'unity#houseNameUpdate'
  
  get 'game' => 'pages#game'
  get 'game/index.html' => 'pages#game'
  
  get 'username' => 'unity#username'
  
  get 'gameStarter/:id' => 'unity#gameStarter'
  get 'gameTester' => 'unity#gameTester'
  post 'updateChoices' => 'unity#updateChoices'
  
  get 'gameData' => 'unity#gameData'
  
  #resources :communities
  get 'communities' => 'builder#communities'
  post 'communities' => 'builder#createCommunity'
  get 'loginStats' => 'pages#loginStats'
  
  
  get 'homepage' => 'pages#home2'
  post 'messages' => 'pages#createMessage'
  
  get 'messages' => 'admin#messages'
  
  get 'houseViewer' => 'pages#houseViewer'
  
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
