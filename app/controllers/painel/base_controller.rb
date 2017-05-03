class Painel::BaseController < ApplicationController

  #before_filter :redirect_to_https

  def redirect_to_https
    redirect_to :protocol => "https://" unless (request.ssl? || request.local?)
  end

end