Rails.application.routes.draw do
 
  resources :document_types
  resources :rols
  resources :documents
  devise_for :users
  resources :actividads do 
        get :get_events, on: :collection
  end
  	
  
  root 'welcome#home'
    
  get "misactividades", to: "actividads#get_act", as: "get_act"
   get "actividades_cerradas", to: "actividads#actividades_cerradas", as: "actividades_cerradas"
  get "actividades", to: "actividads#set_act" , as: "set_act"
  get "user_actividades/:user", to: "actividads#user_actividades" , as: "user_actividades"
  get "usuarios", to: "actividads#usuarios" , as: "usuarios"
  get "actividades_invitado", to: "actividads#invitado" , as: "invitado"
  get "new_seguimiento/:actividad", to: "actividads#new_seguimiento" , as: "new_seguimiento"
  post "create_seguimiento", to: "actividads#create_seguimiento" , as: "create_seguimiento"
  post "create_document", to: "documents#create_document" , as: "create_document"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
