# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :words
      resources :concepts
      resources :syllables
      resources :runes
    end
  end

  root 'homepage#index'
  get '/*path' => 'homepage#index' # redirect to homepage by default
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
