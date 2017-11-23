Rails.application.routes.draw do


 scope "(:locale)", locale: /en|vi/ do

    resources :projects  do
        collection do
          delete 'destroy_all'
        end
    end
    resources :tasks do
        collection do
          delete 'destroy_all'
        end
    end
    
  end 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
