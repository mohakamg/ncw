Rails.application.routes.draw do

  default_url_options :host => "localhost:3000"


  root 'home#home'

  resources :students, except: [:edit, :update, :destroy, :index] do
    resources :orders, except: [:destroy]
  end
  resources :students_sessions, only: [:new, :create, :destroy]
  resources :teacher_sessions, only: [:new, :create, :destroy]

  resources :teachers do
    resources :orders, except: [:destroy, :new, :create]
    member do
      get :confirm_email
    end
  end

end
