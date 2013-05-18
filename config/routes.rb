Cat::Application.routes.draw do
  devise_for :customers, :controllers => {:registrations => "customer_registrations", 
    :passwords => "customer_passwords" }

  namespace 'customer' do
    resources 'dashboard' , :only => [:index]
    resource 'profile', :only => [:show] do
      put :change_password
      put :change_username
    end
  end

  root :to => 'home#index'
end
