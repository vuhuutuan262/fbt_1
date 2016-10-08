Rails.application.routes.draw do
  get "/static_pages/*page" => "static_pages#show"
  root "static_pages#home"
  devise_for :users
end
