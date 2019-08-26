Rails.application.routes.draw do
  resources :words
  resources :aggregates
  resources :language_concepts
  resources :families
  resources :syllables
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
