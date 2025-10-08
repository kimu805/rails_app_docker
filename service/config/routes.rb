Rails.application.routes.draw do
  get "tasks/index"
  get "tasks/new"
  get "tasks/edit"
  get "tasks/show"
  root to: "messages#index"
  resources :messages
end
