Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  get 'welcome/index'
  
    resources :incomes
	
	resources :outgoings
	
	resources :categories
 
  root 'welcome#index'
end