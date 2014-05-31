InTuition::Application.routes.draw do


  resources :example_codes

  resources :course_items

  resources :products

  resources :goals

  resources :qualifications

  resources :notifications do
    collection do
      delete 'group_delete'
    end
  end

  resources :course_contents

  resources :course_bookings

  resources :appointments

  resources :bookings do
    collection do
      delete 'group_delete'
      get 'old'
    end
  end

  resources :profiles

  resources :enrolments

  resources :forum_posts

  resources :forum_contributors

  resources :forums do
    resources :posts 
    get 'add_participant', on: :member
    get 'settings', on: :member
  end

  resources :comments

  resources :class_rooms

  resources :posts

  resources :materials 

  resources :locations

  resources :uploads

  resources :texts

  resources :videos

  resources :subject_topics

  resources :topics do
    resources :materials
  end

  resources :subjects do 
    get 'add_topics', on: :member
  end

  resources :school_courses

  resources :schools do
    get 'add_course', on: :member
    patch 'course_update', on: :member
    resources :locations # school is addressable
  end

  resources :courses do
    resources :locations # course is addressable
    resources :enrolments
    resources :posts
    resources :course_items
    get 'student', to: 'class_rooms#show'
    get 'settings', on: :member
    get 'edit_enrolments', on: :member
    get 'enrol_students', to: 'courses#enrol_students'
    get 'book_a_lesson', on: :member
    get 'new_booking', on: :member
    get 'content', on: :member
    get 'add_content', on: :member
    get 'update_prices', on: :member
    patch 'enrolment_update', to: 'courses#enrolment_update'
    resources :subjects do
      resources :topics
    end
  end

  resources :students do
    get 'enrol_on_course', on: :member
    get 'book_a_lesson', on: :member
  end

  resources :publics

  resources :user_sessions

  resources :users do 
    get 'avatar' => 'users#avatar', as: :avatar
    get 'admin', on: :collection
    resources :locations # user is addressable
  end

  # Login and logout methods
  get "login" => 'user_sessions#new', as: :login
  get "logout" => 'user_sessions#destroy', as: :logout
  get 'my_materials' => 'users#my_materials', as: :my_materials 
  get 'my_office' => 'users#my_office', as: :my_office
  get 'denied' => 'publics#denied_action', as: :denied

  #admin routes
  resources :admin do
    get 'users', on: :collection
    get 'uploads', on: :collection
    get 'comments', on: :collection
    get 'posts', on: :collection
    get 'uploads', on: :collection
    get 'courses', on: :collection
    get 'forums', on: :collection
  end

  # Root home page
  root :to => 'publics#introduction'
  get 'search' => 'publics#search', as: :search

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
