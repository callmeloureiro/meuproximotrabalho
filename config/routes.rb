Rails.application.routes.draw do
  
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'

  namespace :api do
    namespace :v1 do
      resources :jobs, only: [:index]
    end
  end

  devise_for :companies, 
    :path => 'c', 
    :path_names => {:sign_in => 'login', :sign_out => 'logout', :sign_up => "cadastro"}

  devise_for :users, 
    controllers: { 
      registrations: "user/registrations" 
      #confirmations: 'user/confirmations' 
    },
    :path => 'u', 
    :path_names => {:sign_in => 'login', :sign_out => 'logout', :sign_up => "cadastro"}

  devise_scope :user do
    get 'u/tipo_usuario', :to => 'user/registrations#type_user', as: 'tipo_usuario'
  end

  namespace :admin do
    root 'home#index'
    resources :jobs, excerpt: [:show] do
      put 'approved' => "jobs#approved"
    end
    resources :users, excerpt: [:show]
  end

  namespace :painel do
    get '/' => 'home#index'
    namespace :user, :path => 'u' do 
      root 'home#index'
      resources :jobs, excerpt: [:show] do
        member do
          get 'candidatos' => 'jobs#subscribers'
        end
      end
      resources :users, only: [:edit, :update], :path => "meu-perfil"
      resources :acurriculum, only: [:index, :create], path: 'analise-curriculo'
      resources :gcurriculum, only: [:index, :create], path: 'gerador-curriculo'
      get 'premium' => 'premium#index'
      get 'premium/order_abandoned' => 'premium#order_abandoned'
      get 'checkout/:id' => 'checkout#create', as: 'user_checkout'
      match 'payment/:id' => 'payment#create', as: 'payment', via: [:get, :post]
    end
    namespace :company do

    end
  end

  namespace :email do
    post 'sendcv' => 'emails#sendcv'
    post 'sendmsg' => 'emails#sendmsg'
  end

  root 'home#index'

  get 'perfil/:id'      => 'users#show', as: 'user_profile'

  get "estagios"        => "internships#index", as: "internships"
  get 'estagios/query'  => "internships#query", as: "internships_search"

  get "estagio/:id"     => "jobs#show", as: "internship"
 
  get "trabalhos"       => "jobs#index"
  get 'trabalhos/query' => "jobs#query", as: "jobs_search"
  get  'trabalho/:id'   => 'jobs#show', as: 'job'
  post 'trabalho/:id'   => 'jobs#apply', as: 'job_apply'
  delete 'trabalho/:id' => 'jobs#removeapply', as: 'job_remove'

  get "buscar/query"    => "search#query", as: "search_query"
  get "buscar"          => "search#index", as: "search"

  get 'empresas'        => "page#companies"
  get 'falta-pouco'     => "page#maintenance"
  get 'fale-conosco'    => "page#contact"
  get 'seja-premium'    => "page#premium"

  post 'notification_payment' => 'notification#create'

end
