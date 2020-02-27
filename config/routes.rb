Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: :registrations}
  get 'home/dashboard', as: :welcome
  root 'home#landing'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
