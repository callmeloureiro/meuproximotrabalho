class Api::V1::BaseController < ActionController::Base
  protect_from_forgery with: :null_session
end