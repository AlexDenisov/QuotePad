QuotePad::Application.routes.draw do

  devise_for :users, 
             :path => ""
  as :user do
    get 'sign_in' => 'devise/sessions#new'
    post 'sign_in' => 'devise/sessions#create'
    delete 'sign_out' => 'devise/sessions#destroy'
  end

  resources :excerpts, :users

  root :to => "excerpts#index"

end
