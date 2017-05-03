class BaseController < ApplicationController

  #before_filter :redirect_to_http

  def redirect_to_http
    redirect_to :protocol => "http://" if (request.ssl?)
  end

end