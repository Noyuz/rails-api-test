Rails.application.routes.draw do
  scope :api do
    scope :v1 do
      resources :students
      resources :tests
    end
  end
end
