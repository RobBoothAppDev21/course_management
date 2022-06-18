Rails.application.routes.draw do
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :courses, only: %i[index show] do
    # collection do
    #   match 'search' => 'courses#index', via: [:get, :post], as: :search
    # end
    resources :sections, only: %i[index show] do
    end
  end

  # get '/sections', to: 'sections#index'

  # get '/courses/:id', to: 'courses#show'
  # get '/course/:id/sections', to: 'sections#index'
  get '/instructors', to: 'instructors#index', as: 'instructors'
  get '/bid_histories', to: 'bid_histories#index', as: 'bid_histories'
  get '/evaluations', to: 'evaluations#index', as: 'evaluations'

  root 'courses#index'
end
