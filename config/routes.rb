PrivilegedSessions::Application.routes.draw do
  resources :notes

  devise_for :users

  root to: 'high_voltage/pages#show', id: 'home'
end
