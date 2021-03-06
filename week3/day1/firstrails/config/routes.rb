Rails.application.routes.draw do
  #root 페이지로 들어오면 home컨트롤러의 index 액션을 보여줄게.

  root 'home#index'
  get 'home/index'
  #http://localhost:3000/lotto 요청이 들어오면 home컨트롤러의 lotto 액션으로 보내줭 .
  get '/lotto' => 'home#lotto'
  get '/welcome' => 'home#welcome'
  get '/welcome/:name' => 'home#welcome'
  get '/square/:num' => 'home#square'
  get '/lunch' =>'home#lunch'
  get '/google' => 'home#google'
  get '/vote' => 'home#vote'
  get '/result' => 'home#result'
  get '/lunchimg' => 'home#lunchimg'
  get '/game1/:user' =>'home#game1'
  get '/game2' => 'home#game2'

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
