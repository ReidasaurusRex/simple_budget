Rails.application.routes.draw do
  # site views
  root to: 'site#landing'

  post '/sign_in', to: 'access#sign_in_attempt', as: 'sign_in'

  delete '/sign_out', to: 'access#sign_out', as: 'sign_out'

  get '/about', to: 'site#about', as: 'about'

  resources :users, except: :index do
    resources :week_budgets, except: :index do 
      resources :expenditures, except: [:index, :show]
    end
    resources :month_budgets, except: :index do
      resources :expenditures, except: [:index, :show]
    end
    resources :expenditures, except: [:index, :show]
  end

  get '/users/:id/delete', to: 'users#delete', as: 'delete_user'

  get '/users/:user_id/week_budgets/:id/delete', to: 'week_budgets#delete'

  get '/users/:user_id/month_budgets/:id/delete', to: 'month_budgets#delete'


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
