Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :students, except: [:edit, :update, :destroy, :index]
  resources :students_sessions, only: [:new, :create, :destroy]

  resources :teachers do
    member do
      get :confirm_email
    end
  end

end
