Rails.application.routes.draw do
  root 'courses#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get '/sections', to: 'sections#index'

  # get '/courses/:id', to: 'courses#show'
  # get '/course/:id/sections', to: 'sections#index'
  get '/instructors', to: 'instructors#index', as: 'instructors'
  get '/bid_histories', to: 'bid_histories#index', as: 'bid_histories'
  get '/evaluations', to: 'evaluations#index', as: 'evaluations'
end
