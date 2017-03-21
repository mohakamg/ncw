Rails.application.routes.draw do

  default_url_options :host => "localhost:3000"


  root 'home#home'

  resources :students, except: [:edit, :update, :destroy, :index] do
    resources :orders, except: [:destroy]
  end
  resources :students_sessions, only: [:new, :create, :destroy]
  resources :teacher_sessions, only: [:new, :create, :destroy]

  post 'pastedImage/:order_id/image' => 'orders#pastedImages'

  get 'reset_password' => 'teachers#reset_pass'
  post 'reset_password' => 'teachers#reset_pass_mail'

  get 'reset_password_link' => 'teachers#reset_password_link'
  post 'reset_password_link' => 'teachers#reset_password'

  resources :teachers do
    resources :orders, except: [:destroy, :new, :create] do
      patch :accept_order_path
    end
    member do
      get :confirm_email
    end
  end

end
