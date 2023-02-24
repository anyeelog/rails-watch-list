Rails.application.routes.draw do
  root to: 'lists#index'

  resources :lists, only: %i[index show new create edit update] do
    resources :bookmarks, only: %i[new create]
  end
  resources :bookmarks, only: [:destroy]
end

# resources :restaurants, only: [:index, :new, :create, :show] do
#   resources :reviews, only: [:new, :create]
# end
