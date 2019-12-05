# frozen_string_literal: true

Rails.application.routes.draw do
  root 'homepage#index'

  resources :concepts
  resources :words
  resources :aggregates
  resources :language_concepts
  resources :families
  resources :syllables
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
