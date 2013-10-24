TrailerPark::Application.routes.draw do
  resources :users, except: [:index] do
    resources :movies, only: [:index, :create]
  end

  resources :movies, except: [:create,] do
    collection do 
      get "search"
      get "search_by_keyword"
      get "search_by_full_title"
      get "redirect_from_keyword"
    end
  end


  resource :session, only: [:new, :create, :destroy]

end


