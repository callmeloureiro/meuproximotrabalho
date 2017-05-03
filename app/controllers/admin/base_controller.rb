class Admin::BaseController < ApplicationController

  layout 'admin'

  before_filter :is_admin?

  private
    def is_admin?
      unless current_user && current_user.admin?
        raise ActionController::RoutingError.new('Not Found')
      end
    end

end