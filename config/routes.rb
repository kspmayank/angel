Rails.application.routes.draw do
  get 'welcome/index'

  get 'users/index'

  get 'sessions/index'

  get 'questions/index'

  get 'comments/index'

  get 'categories/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

      post 'questions/new' => 'questions#create'
      #post 'questions/:question_id/answers/new' => 'answers#create'
      post 'questions/:question_id/answers/:answer_id/comments/new' => 'comments#create'
      post 'questions/:question_id/answer/new' => 'answers#create'
      #get 'questions/new' => ''
      #get 'questions/:question_id' => 'questions#show'
      get '/login' => 'sessions#new'
      get '/signup' => 'users#new'
      post '/login' => 'sessions#create'
      get '/logout' => 'sessions#destroy'
      get '/login/forgot' => 'users#forgot_password_get'
      post '/login/forgot' => 'users#forgot_password'

      get '/upvote/:id' => 'questions#upvote'

      get '/doctors/signup' => 'users#new_doctor'
      post '/doctors' => 'users#create_doctor'

      

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

      resources :users
      #resources :questions
      resources :sessions
      resources :categories

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

    resources :questions do
        resources :answers do
          resources :comments
        end
      end

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
      namespace :api, defaults: {format: 'json'} do
        namespace :v1 do
          resources :homes
          resources :questions do
            resources :answers do
              resources :comments
            end
          end
        end
      end



end
