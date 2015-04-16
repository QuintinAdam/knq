Rails.application.routes.draw do

  mount Upmin::Engine => '/admin'

  devise_for :users,
              path: '',
              path_names: {
                sign_in: 'sign-in',
                sign_out: 'sign-out',
                registration: 'sign-up',
                sign_up: ''
              }

  get '/photos', to: 'pictures#index', as: :pictures
  get '/photos/:category', to: 'pictures#show', as: :picture
  # resources :pictures, only: [:index, :show]
  post '/new-rsvp', to: 'users#new_rsvp', as: :new_rsvp
  post '/rsvp', to: 'users#rsvp', as: :rsvp
  root to: 'visitors#index'
end
