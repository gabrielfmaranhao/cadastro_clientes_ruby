Rails.application.routes.draw do
  resources :emails, path:"/clientes/emails/"
  resources :telefones, path:"/clientes/telefones/"
  resources :clientes
  resources :usuario, only: [:index, :destroy, :create, :update], path:"/admin/usuario/"
  post "/admin/login/", to: "usuario#login"

end
