Aa::Application.routes.draw do
  ##mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

   resources :posts do
    resources :comments
    resources :tags
   end

   get "home/index"

   match 'posts/:id/remove_tag/:tag_id'=>'posts#remove_tag'
   match 'posts/:id/add_tag/'=>'posts#add_tag'
   match 'posts/tag/:tag_id', :to=> 'posts#tag'

   devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }


   root :to => 'posts#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
