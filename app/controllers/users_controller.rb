class UsersController < BaseController

  def show
    @user = User.friendly.find(params[:id])
  end

end