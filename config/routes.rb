Rails.application.routes.draw do
  scope :api do
    resources :requirements, only: [:create]
  end 
end
