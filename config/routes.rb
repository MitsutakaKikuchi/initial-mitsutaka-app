Rails.application.routes.draw do
  root to: 'home#top'
  get "/students" => "post#user"
  get "/chief" =>"user#user_top"
  get "/top" =>"home#top"
  get "/students/:id/" => "post#show"
  
  resources :students, only: :show, param: :arrive_id, constraints: { code: /\d+/ }

  get "/list" => "post#kids_list"
  get "/students/:id/edit" => "post#edit"
  post "/students/:id/destroy" => "post#destroy"

  post "/students/kids_all_delete" => "post#kids_all_delete"
  post "/students/:id/kids_destroy" => "post#kids_destroy"
  post "/students/kidspost" => "post#kidspost"
  get "/home_time" => "post#home_time"
  post "/students/:id/absence" => "post#absence"
  get "/absence" => "post#absence_home_time"
  post "/students/create" => "post#create"
  post "/students/:id/update" => "post#update"
  get "login" => "user#login_form"
  get "/" => "user#login_form"
  post "login" => "user#login"
  post "logout" => "user#logout"
  get "/login" => "home#login"

  post "user/delete" => "user#delete"
  get "/sign_up" => "user#sign_up"
  post "sign_up_user" => "user#sign_up_user"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
