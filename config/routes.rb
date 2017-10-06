Rails.application.routes.draw do
  #resources :archives
  scope "api" do
  	resources :bookmarks
    match '/search', controller: 'bookmarks', action: 'archive', via: :get
    match '/favour', controller: 'bookmarks', action: 'favourite', via: :get
  end
   root to: "main#index"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
