Rails.application.routes.draw do
  devise_for :users
  resources :cathegories
  resources :courses
  resources :articles
  resources :services
  resources :faqs
  resources :clients
  resources :experiences
#  resources :reviews

# get 'main' => 'pages#main'

# get 'about' => 'pages#about'

get 'consultation' => 'pages#consultation'

# get 'contacts' => 'pages#contacts', as: :contacts

get 'education' => 'pages#education' 

# get 'tests' => 'pages#tests'

# get 'faq' => 'pages#faq', as: :my_faq

# get 'contract' => 'pages#contract', as: :contract

get 'my-services' => 'pages#services', as: :my_services

#get 'my-reviews' => 'pages#reviews', as: :my_reviews

# get 'work-with' => 'pages#work_with', as: :work_with 

# get 'methods' => 'pages#methods', as: :methods

# get 'text' => 'pages#text', as: :text

get 'make_order' => 'pages#make_order', as: :make_order
get 'new_menu' => 'pages#new_menu', as: :new_menu

#scope '/new' do
  get '/'               => 'new#main', as: :new
  get '/about'          => 'new#about'
  get '/contacts'       => 'new#contacts'
  get '/faq'            => 'new#faq', as: :my_faq
  get '/reviews'        => 'new#reviews', as: :my_reviews
  get '/consultations'  => 'new#consultations'
  get '/contract'       => 'new#contract'
  get '/methods'        => 'new#methods'
  get '/services'       => 'new#services'
  get '/work-with'      => 'new#work_with'
  get '/Psychotherapy-for-panic-disorder'   => 'new#psychotherapy_for_panic_disorder'
  get '/Psychotherapy-of-anxiety'           => 'new#psychotherapy_of_anxiety'
  get '/Psychotherapy-of-depression'        => 'new#psychotherapy_of_depression'
  get '/Psychotherapy-of-neuroses'          => 'new#psychotherapy_of_neuroses'
  get '/Psychotherapy-of-psychotrauma'      => 'new#psychotherapy_of_psychotrauma'
  get '/Relationship'                       => 'new#relationship_counseling'
  get '/Coaching-and-training'              => 'new#coaching_and_training'
  get '/Transactional-analysis'             => 'new#ta'
  get '/Acceptance-and-Commitment-Therapy'  => 'new#act'
  get '/Cognitive-Behavioral-Therapy'       => 'new#cbt'
  get '/Emotional-Figurative-Therapy'       => 'new#eit'
  get '/Metacognitive-therapy'              => 'new#mct'
  get '/STA'                                => 'new#sta'
  get '/OCD-psychotherapy'                  => 'new#ocd_psychotherapy'
  get '/Low-self-esteem-psychotherapy'      => 'new#low_selfesteem_psychotherapy'
#end

root "new#main"
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
