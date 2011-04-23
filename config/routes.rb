Rling::Application.routes.draw do     

# Directs /admin/products/* to Admin::ProductsController
# (app/controllers/admin/products_controller.rb)
  
scope :module => "admin" do
  match "admin/dashboard" =>"admin#dashboard"
  match "admin/clear_cache"=>"admin#clear_cache"


  #Category related resources
  #categories
  resources :categories do
    collection do
      post 'update_position'
    end
   end
  #categorysets
  resources :categorysets
  #Permissions related resources
  resources :permissions do
    collection do
      post 'save_permission_roles'
    end
  end
  #permissions
  resources :permission_roles
   #Email Templates 
   resources :mailers do
     member do
       get 'sendmail'
       post 'preparemail'
     end
   end
  # Menusets
  resources :menusets
  resources :menus do
    collection do
     post 'update_position'
    end
   end   
  # Pages
  resources :pages do
    collection do
      get 'object_form_index'
      get 'new_object_form'
      get 'new_view'
      get 'view_index'
      get 'new_category_view'
      get 'category_view_index'
    end
    member do
      get  'query'
      post 'create_query'
    end
  end
  # Pagelets 
  resources :pagelets
  # Object Forms
  resources :object_forms do
     resources :form_components  do
       collection do
          post 'update_position'
        end
     end
     resources :form_submissions do
      member do
 	get 'delete_asset'
      end 
     end
  end
  # Views
  resources :views do
      resources :view_components do
        collection do
          post 'update_position'
        end
      end
      resources :view_conditions
      resources :view_orders
  end
  # Page Variable Settings
  resources :page_variable_settings
   # Roles
  resources :roles
  # Settings
  resources :settings
  # User Detail Settings
  resources :user_detail_settings do
    collection do
          post 'update_position'
        end
  end

end

  #Object Models related Resources
  resources :object_models do
    #components associated to models 
    resources :model_components do
      collection do
        post 'update_position'
      end
    end
    # Components required by models
    resources :comment_components
    # submissions made for object models
    resources :model_submissions do
      member do
        get 'delete_asset'
        get 'add_category'
        post 'category_add'
        get 'category_remove'
      end
      # all the comments submitted for model submissions
      resources :comment_submissions
    end
   end
  
  resources :users do
    member do
      get 'activate'
      get 'user_details'
      post 'update_details'
      get 'delete_asset'
    end
  end
 
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
  
  namespace :ckeditor do
   resources :pictures, :only => [:index, :create, :destroy]
   resources :attachments, :only => [:index, :create, :destroy]
   resources :attachment_files, :only => [:index, :create, :destroy]
  end
 
  match "account"=> "users#show"
  match "login" => "sessions#new"
  match "logout" => "sessions#destroy"
  match "register" => "users#new"
  match "admin"=>"admin/admin#dashboard"

  match "display/error_page_display"=>"display#error_page_display"
  match "display/no_permissions"=>"display#no_permissions"
  match "display/create_submissions/:id"=>"display#create_submissions"
  match "display/create_comment_submissions/:id"=>"display#create_comment_submissions"
  match "display/search_result"=>"display#search_result"
  match "search"=>"display#search_result"
  match "profile/:id"=>"display#profile"
  match "/:permalink"=> "display#show_page"
  match "/:permalinkparent/:permalink"=> "display#show_model_data"
 
  root :to => "display#index"
end
