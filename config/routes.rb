Rails.application.routes.draw do


  get '/', to: 'marvel_stories#fetch_story'
  root to: 'marvel_stories#fetch_story'

  resources :marvel_stories do
    collection do
      get :fetch_story
    end
  end

  match '/:anything_else', to: 'marvel_stories#fetch_story',
        via: [:create, :patch, :get, :options, :post, :put, :delete, :copy, :head, :lock, :unlock, :PROPFIND]

end
