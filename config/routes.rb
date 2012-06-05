Garitas::Application.routes.draw do
  root to: "garitas#index"
  resources :cities do
    resources :ports
  end
end
