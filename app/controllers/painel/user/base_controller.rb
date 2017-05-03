class Painel::User::BaseController < Painel::BaseController

  layout 'painel'

  before_filter :authenticate_user!

  def user_premium?
    unless current_user.user_premium?
      redirect_to painel_user_premium_url(:not_premium => true)
    end
  end

end