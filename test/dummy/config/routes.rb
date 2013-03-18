Rails.application.routes.draw do

  mount FacebookJs::Engine => "/facebook_js"
end
