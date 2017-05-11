class ApplicationController < ActionController::Base
  http_basic_authenticate_with(
    name: Rails.application.secrets.fetch(:name),
    password: Rails.application.secrets.fetch(:password)
  )
  protect_from_forgery with: :exception
end
