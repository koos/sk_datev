CsvImporter::Application.routes.draw do

  match 'login' => 'sessions#create', :via => :post, :as => :login
  match 'login_success' => 'sessions#new', :via => :get, :as => :login_success
  
  root :to => 'frontend#index'
end
