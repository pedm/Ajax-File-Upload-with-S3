AjaxUpload::Application.routes.draw do
  resources :uploads
  root :to => "home#index"
end