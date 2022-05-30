Rails.application.routes.draw do
  # Defines the root path route ("/")
  root 'static_page#home'
  get 'static_page/help'
  get 'static_page/about'

end
