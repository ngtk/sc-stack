class ApplicationController < ActionController::Base
  layout 'flatly'
  protect_from_forgery with: :exception
end
