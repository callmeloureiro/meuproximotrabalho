class Painel::User::UsersController < Painel::User::BaseController

  before_action :set_user

  def edit
  end

  def update
    respond_to do |f|
      unless params[:user][:password].blank?
        @user.update(users_params)
        f.html { redirect_to edit_painel_user_user_url(@user.slug), notice: "Usuário atualizado com sucesso" }
      else
        @user.update_without_password(users_params)
        f.html { redirect_to edit_painel_user_user_url(@user.slug), notice: "Usuário atualizado com sucesso" }
      end
    end
  end

  private
    def set_user
      @user = User.find(current_user.id)
    end

    def users_params
      params.require(:user).permit(:name, :office, :about, :zipcode, :city, :state, :district, :address, :complement, :email, :password, :password_confirmation, :website, :phone, :facebook, :googleplus, :twitter, :github, :instagram, :date_of_birth, :cpf, :pinterest, :avatar, :cv_pdf, :cnpj, :company_name, :slug, :number)
    end

end