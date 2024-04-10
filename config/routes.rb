Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root "home#index"

    get "demo" => "demo#index"
    get "experience" => "experience#index"
    get "services" => "service#index"

    # Redirect blog to HEY World
    get "blog" => redirect("https://world.hey.com/niza")

    get "404" => "errors#not_found"
    get "500" => "errors#internal_server_error"
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
