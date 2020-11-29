Rails.application.routes.draw do
  root 'welcome#index'

  get '/publisher/:id', to: 'welcome#shops'

  post '/shop', to: 'welcome#sold_copies'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


	
