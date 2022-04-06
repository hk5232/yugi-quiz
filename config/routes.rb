Rails.application.routes.draw do
  root "quizzes#index"
  resources :quizzes do
    collection do
      get 'start'
      get 'question'
      get 'answer'
      get 'end'
      get 'question2'
      get 'answer2'
      
    end
  end
end
