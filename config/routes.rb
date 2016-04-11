Rails.application.routes.draw do
  resources :enrollments
  resources :quarters
  resources :company_categories
  resources :frequently_asked_questions
  resources :graduation_projects do
    get 'search', on: :collection
  end
  resources :subjects
  resources :professional_practices do
    get 'search', on: :collection
  end
  resources :academies do
    get 'academy_belongs_to_user', on: :collection
  end
  resources :students do
    get 'student_belongs_to_user', on: :collection
  end
  resources :majors
  resources :faculties
  resources :campus
  resources :companies do
    get 'company_belongs_to_user', on: :collection
  end
  mount_devise_token_auth_for 'User', at: 'auth'

  get 'user_management/unverified_users', to: 'user_management#unverified_users'
  put 'user_management/verify_user', to: 'user_management#verify_user'
  get 'user_management/get_profile_info', to: 'user_management#get_profile_info'
  # devise_for :users
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
