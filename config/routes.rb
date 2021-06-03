Rails.application.routes.draw do
  get '/mypage', to: 'users#show'
  get '/term',   to: 'static_pages#term'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    root "users/sessions#new"
    patch 'users/confirmation', to: 'users/confirmations#confirm'
  end

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
