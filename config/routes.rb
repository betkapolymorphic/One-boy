Rails.application.routes.draw do
  get 'welcome/index'

  resource :images do
  get :nextPicture,on: :collection
  get :prevPicture,on: :collection
  end
  # You can have the root of your site routed with "root"
 root 'welcome#index'

end
