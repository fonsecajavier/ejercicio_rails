ActionController::Routing::Routes.draw do |map|

  map.root :controller => "accounts"
  map.resources :accounts do |account|
    account.resources :employees, :except => [:index, :show]
  end

end
