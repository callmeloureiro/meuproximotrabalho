class Painel::HomeController < ApplicationController

  before_action :redirect_to_panel

  def index
  end

  private

    def redirect_to_panel
      redirect_to painel_user_root_url
    end

end