Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  get 'movies/:id/same_director' => 'movies#same_director', as: :same_director
  root :to => redirect('/movies')
end
