CsvImporter::Application.routes.draw do

  match 'login' => 'sessions#create', :via => :post, :as => :login
  match 'login_success' => 'sessions#new', :via => :get, :as => :login_success
  resources :exports do
    collection do
      get :prepare_new
    end
  end
  root :to => 'frontend#index'
end
