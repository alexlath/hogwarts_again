Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Professors
  get '/professors', to: 'professors#index'
  get '/professors/:id', to: 'professors#show'

  # Students
  get '/students', to: 'students#index'
end
