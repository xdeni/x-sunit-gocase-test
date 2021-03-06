Rails.application.routes.draw do
   
  # Reports routes.
  get 'reports/abducted_survivors'
  get 'reports/non_abducted_survivors'
  get 'reports/abducted_percentage'

  #############
  # RESOURCES #
  #############

  # Locations routes.
  resources :locations, only: [:index, :show] do 
    resource :survivor, only: [:index, :show]
  end
  
  # Denunciations routes.
  resources :denunciations, only: [:index, :show, :create] do
    resource :survivor, only: [:index, :show]
  end

  # Survivors routes (destroy route is not used).
  resources :survivors, only: [:index, :show, :create, :update] do
    resource :location, only: [:index, :show]
    resource :denunciations, only: [:show]
  end
end
