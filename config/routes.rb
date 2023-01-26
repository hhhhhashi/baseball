Rails.application.routes.draw do

  namespace :admin do
    resources :members, only: [:index, :show, :edit ,:update]
  end

  namespace :admin do
    resources :recruits, only: [:index, :show, :delete]
  end

  namespace :admin do
    root to: 'homes#top'
  end


  scope module: :public do
    resources :applies, only: [:show, :index, :new, :create]
    post 'confirm' => 'applies#confirm'
    get 'complete' => 'applies#complete'
    get 'confirm' => 'applies#confirm'
  end

  scope module: :public do
    root to:"homes#top"
    get 'about' => 'homes#about', as: 'about'
  end

  scope module: :public do
    get 'my_page' => 'members#show'
    get 'information/edit' => 'members#edit'
    patch 'information/edit' => 'members#update'
    get 'unsubscribe' => 'members#unsubscribe'
    patch 'withdrawal' => 'members#withdrawal'
  end

  scope module: :public do
    resources :recruits, only: [:new, :create, :destroy, :index, :show, :edit, :update]
    post 'confirm' => 'recruits#confirm'
    get 'confirm' => 'recruits#confirm'
  end
  #募集要項作成ページ、一覧ページを作成するルーティングの設定




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