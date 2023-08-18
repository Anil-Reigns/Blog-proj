Rails.application.routes.draw do

  get "home", to: "contents#home"
  get "create", to: "contents#new"
  post "create", to: "contents#create" 
  get "login", to: "users#login" 
  post "login", to: "users#validate"
  get "signup", to: "users#signup" 
  post "signup", to: "users#adduser"
  get "edit", to: "contents#edit"
  post "edit", to: "contents#update"
  get "myblog", to: "contents#myblog"
  delete "myblog", to: "contents#delete"
  get "info", to: "contents#info"
  get "about", to: "contents#about"
  get "show", to: "contents#show"
  post "show", to: "contents#addcomment"
  post "filter", to: "contents#filter"
  get "filter", to: "contents#result"
  post "like", to: "contents#addlike"
  get "home", to: "contents#home"
  post "/cat_filter", to: "contents#cat_filter"
  get "cat_filter", to: "contents#cat_results" 

end
