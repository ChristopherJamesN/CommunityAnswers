Rails.application.routes.draw do
  get '/users', to: 'users#show'
  devise_for :users
  get '/questions/your_questions', to: 'questions#your_questions'
  resources :questions
  root to: "questions#home"
end
