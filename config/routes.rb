QuotePad::Application.routes.draw do

  devise_for :users, 
             :path => "", 
             :skip => [:registrations]

  as :user do
    get 'sign_in' => 'devise/sessions#new'
    post 'sign_in' => 'devise/sessions#create'
    delete 'sign_out' => 'devise/sessions#destroy'
  end

  resources :excerpts do
    put 'vote_up' => 'excerpts#vote_up', 
        :as => 'vote_up', 
        :on => :member, 
        :defaults => { :format => :js }
    put 'vote_down' => 'excerpts#vote_down', 
        :as => 'vote_down', 
        :on => :member,
        :defaults => { :format => :js }
    get 'best', :on => :collection
    get 'latest', :on => :collection
  end

  resources :users
  root :to => 'excerpts#index'

end
