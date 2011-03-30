Rling::Application.routes.draw do
  resources :permission_roles

 resources :permissions

 resources :object_models do
   resources :model_components
   resources :model_submissions do
      member do
 	    get 'delete_asset'
      end
   end
 end


  resources :mailers do
    member do
      get 'sendmail'
      post 'preparemail'
    end
  end

  resources :pagelets

  resources :menus do
    collection do
     post 'update_position'
    end
   end   
  

  resources :menusets
  resources :pages do
    collection do
     
      get 'object_form_index'
      get 'new_object_form'	
     end
   end

   resources :object_forms do
     resources :form_components 
     resources :form_submissions do
      member do
 	get 'delete_asset'
      end 
     end
   end

  resources :page_variable_settings
  resources :roles
  resources :users do
    member do
      get 'activate'
      get 'user_details'
      post 'update_details'
      get 'delete_asset'
    end
  end
  resources :settings
  resources :user_detail_settings
  resources :password_resets do
   member do
     get 'reset'
   end
   collection do
     post 'change'
   end 
  end
  resources :sessions do 
    collection do
     get 'first_user'
     post 'first_user_create'
    end
  end
  match "account"=> "users#show"
  match "login" => "sessions#new"
  match "logout" => "sessions#destroy"
  match "register" => "users#new"
  match "admin"=>"admin#dashboard"
  match "admin/dashboard" =>"admin#dashboard"
  match "admin/clear_cache"=>"admin#clear_cache"
  match "/:permalink"=> "display#show_page"
  match "display/error_page_display"=>"display#error_page_display"
  match "display/create_submissions/:id"=>"display#create_submissions"
  match "/:permalinkparent/:permalink"=> "display#show_model_data"

  root :to => "display#index"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
