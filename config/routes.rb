Rails.application.routes.draw do

  namespace :admin do
    resources :members, only: [:index, :show, :edit ,:update] do
      resources :recruits, only: [:index]
    end
    resources :reports, only: [:index, :show, :update]
  end

  namespace :admin do
    resources :recruits, only: [:show, :destroy] do
      resources :post_comments, only: [:destroy]
    end
  end

  namespace :admin do
    root to: 'homes#top'
  end

  namespace :admin do

  end


  scope module: :public do
    resources :applies, only: [:show, :index, :update]
    get 'confirm' => 'applies#confirm'
    post 'confirm' => 'applies#confirm'
    get 'complete' => 'applies#complete'
  end

  scope module: :public do
    root to:"homes#top"
    get 'about' => 'homes#about', as: 'about'
  end

  scope module: :public do
    get 'my_page' => 'members#show'
    get '/detail/:id' => 'members#detail', as: "member_detail"
    get 'information/edit' => 'members#edit'
    patch 'information/edit' => 'members#update'
    get 'unsubscribe' => 'members#unsubscribe'
    patch 'withdrawal' => 'members#withdrawal'

    post 'report/:member_id' => 'reports#create' , as: "report"
    get 'report/:member_id' => 'reports#new' , as: "report_page"
  end

  scope module: :public do
    resources :recruits, only: [:new, :create, :destroy, :index, :show, :edit, :update] do
     resources :applies, only: [:new, :create]
     resources :post_comments, only: [:create]
     resource :good_recruits, only: [:create, :destroy]
    end
    post 'check' => 'recruits#check'
    get 'check' => 'recruits#check'
    get 'farvorite' => 'recruits#farvorite'
    get 'area' => 'recruits#area'
    get 'search' => 'recruits#search'
  end
  #募集要項作成ページ、一覧ページを作成するルーティングの設定


  scope module: :public do
    resources :notifications, only: :index
  end





  # 顧客用
# URL /customers/sign_in ...
devise_for :member, path: "customer", skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
