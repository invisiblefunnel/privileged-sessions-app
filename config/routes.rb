PrivilegedSessions::Application.routes.draw do
  resources :privileged_sessions, only: [:new, :create] do
    collection { delete :destroy }
  end

  devise_for :users, controllers: { registrations: 'registrations' }

  root to: 'high_voltage/pages#show', id: 'home'
end
