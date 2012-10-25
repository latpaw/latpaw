require 'factory_girl'
	#spec/factories.rb
	FactoryGirl.define do
	  factory :user do
	    sequence(:email){|n| "email#{n}@factory.com" }
	    password "888888"
	    password_confirmation "888888"
	  end
	 
	  factory :post do
	      title "Hello"
	      association :user
	      #association :author, :factory => :user    #关联另一个用户，同时定义一个别名。
 	    end
 	end