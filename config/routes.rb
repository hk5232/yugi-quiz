Rails.application.routes.draw do
  root "quizzes#index"
  resources :quizzes do
    collection do
      get 'start'
    end
  end
end
