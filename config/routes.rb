PrivilegedSessions::Application.routes.draw do
  resources :notes
  resources :privileged_sessions, only: [:new, :create] do
    collection { delete :destroy }
  end

  devise_for :users

  root to: 'high_voltage/pages#show', id: 'home'
end
