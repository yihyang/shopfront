Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :product_types
    resources :products,
      path: '/:product_type_slug',
      constraints: ->(request) { ProductType.exists?(slug: request[:product_type_slug]) }
  end
end
