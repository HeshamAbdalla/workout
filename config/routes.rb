Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations'}

  resources :users do
    resources :exercises
  end

   root to: "dashboard#index"
end
