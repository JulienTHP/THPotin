# frozen_string_literal: true

Rails.application.routes.draw do
  # get '/user/:id/:user', to: 'index#profile', as: 'profiles'
  # get '/user/:id', to: 'index#potin', as: 'potins'
  # get '/contact', to: 'contact#home'
  # get '/team', to: 'team#home'
  # get '/', to: 'index#home' do 
  # 	erb :index, locals: {gossip: Gossip.all}
  # end

  resources :potins do
   
   resources :comments

   #For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 end

 resources :users do
   resources :comments
 end

 resources :comments
 resources :city


 get '/contact', to: 'contact#home'
 get '/team', to: 'team#home'
 get '/', to: 'index#home' do 
 end

end

