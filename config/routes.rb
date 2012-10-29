Aa::Application.routes.draw do

  resources :commands

  ##mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'


   devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

   resources :posts do
    resources :comments
    resources :tags
   end

   get "home/index"


   resources :tags, :module => :acts_as_taggable_on


   match 'posts/:id/remove/:tag_id'=>'posts#remove'
   match 'posts/:id/add_tag/'=>'posts#add_tag'
   match 'posts/tag/:tag_id', :to=> 'posts#tag'
   match 'posts/:post_id/add_reply/', :to=>'comments#add_reply'
   # match 'tags/add', :to=>"tags#add"

  match 'users/about', :to=>'users#about'
  match 'users/:id', :to=>'users#show'

  root :to => 'posts#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
