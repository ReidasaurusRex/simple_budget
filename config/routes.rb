Rails.application.routes.draw do
  get 'access/sign_in_attempt'

  get 'access/sign_out'

  get 'site/landing'

  get 'site/about'

  get 'site/cookies'

  get 'site/privacy'

  get 'site/tech'

  get 'expenditures/new'

  get 'expenditures/create'

  get 'expenditures/edit'

  get 'expenditures/update'

  get 'expenditures/destroy'

  get 'month_budgets/new'

  get 'month_budgets/create'

  get 'month_budgets/show'

  get 'month_budgets/edit'

  get 'month_budgets/update'

  get 'month_budgets/delete'

  get 'month_budgets/destroy'

  get 'week_budgets/new'

  get 'week_budgets/create'

  get 'week_budgets/show'

  get 'week_budgets/edit'

  get 'week_budgets/update'

  get 'week_budgets/delete'

  get 'week_budgets/destroy'

  get 'users/new'

  get 'users/create'

  get 'users/show'

  get 'users/edit'

  get 'users/update'

  get 'users/delete'

  get 'users/destroy'

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
