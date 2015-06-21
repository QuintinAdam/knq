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
  get '/upload', to: 'pictures#upload', as: :upload
  resources :pictures, only: [:index, :show, :new, :create], path: "/photos"

  get '/new-rsvp', to: 'users#new_rsvp', as: :new_rsvp
  post '/rsvp', to: 'users#rsvp', as: :rsvp
  root to: 'visitors#index'
end

# == Route Map
#
#                   Prefix Verb   URI Pattern                   Controller#Action
#         new_user_session GET    /sign-in(.:format)            devise/sessions#new
#             user_session POST   /sign-in(.:format)            devise/sessions#create
#     destroy_user_session DELETE /sign-out(.:format)           devise/sessions#destroy
#            user_password POST   /password(.:format)           devise/passwords#create
#        new_user_password GET    /password/new(.:format)       devise/passwords#new
#       edit_user_password GET    /password/edit(.:format)      devise/passwords#edit
#                          PATCH  /password(.:format)           devise/passwords#update
#                          PUT    /password(.:format)           devise/passwords#update
# cancel_user_registration GET    /sign-up/cancel(.:format)     users/registrations#cancel
#        user_registration POST   /sign-up(.:format)            users/registrations#create
#    new_user_registration GET    /sign-up(.:format)            users/registrations#new
#   edit_user_registration GET    /sign-up/edit(.:format)       users/registrations#edit
#                          PATCH  /sign-up(.:format)            users/registrations#update
#                          PUT    /sign-up(.:format)            users/registrations#update
#                          DELETE /sign-up(.:format)            users/registrations#destroy
#   accept_user_invitation GET    /invitation/accept(.:format)  devise/invitations#edit
#   remove_user_invitation GET    /invitation/remove(.:format)  devise/invitations#destroy
#          user_invitation POST   /invitation(.:format)         devise/invitations#create
#      new_user_invitation GET    /invitation/new(.:format)     devise/invitations#new
#                          PATCH  /invitation(.:format)         devise/invitations#update
#                          PUT    /invitation(.:format)         devise/invitations#update
#        pictures_category GET    /photos/c/:category(.:format) pictures#show_category
#                 pictures GET    /photos(.:format)             pictures#index
#                          POST   /photos(.:format)             pictures#create
#              new_picture GET    /photos/new(.:format)         pictures#new
#                  picture GET    /photos/:id(.:format)         pictures#show
#                 new_rsvp GET    /new-rsvp(.:format)           users#new_rsvp
#                     rsvp POST   /rsvp(.:format)               users#rsvp
#                     root GET    /                             visitors#index
#
