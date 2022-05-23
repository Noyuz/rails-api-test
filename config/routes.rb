Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :students
      get 'students/:id/stats', to: 'students#stats'

      # 2. Route the stats action.
      #    It should be accessable under /api/v1/students/:id/stats
      resources :tests do
        resources :results, controller: 'test_results'

        member do
          get 'stats'
        end
      end
      get 'subjects/:subject/stats', to: 'subjects#stats'
    end
  end
end
