class ApplicationController < ActionController::Base
  binding.pry
  http_basic_authenticate_with name: 'dave',
                               password: 'secret'
  protect_from_forgery with: :exception
end
