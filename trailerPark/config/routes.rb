TrailerPark::Application.routes.draw do
   resources :users, except: [:index]
end
