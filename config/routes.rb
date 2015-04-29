Rails.application.routes.draw do

  # mount Upmin::Engine => '/admin'

  devise_for :users,
              controllers: {registrations: "users/registrations"},
              path: '',
              path_names: {
                sign_in: 'sign-in',
                sign_out: 'sign-out',
                registration: 'sign-up',
                sign_up: ''
              }


  get '/photos/c/:category', to: 'pictures#show_category', as: :pictures_category
  resources :pictures, only: [:index, :show, :new, :create], path: "/photos"

  get '/new-rsvp', to: 'users#new_rsvp', as: :new_rsvp
  post '/rsvp', to: 'users#rsvp', as: :rsvp
  root to: 'visitors#index'
end

# == Route Map
#
#   Prefix Verb URI Pattern         Controller#Action
# new_rsvp GET  /new-rsvp(.:format) users#new_rsvp
#     rsvp POST /rsvp(.:format)     users#rsvp
#     root GET  /                   visitors#index
#
