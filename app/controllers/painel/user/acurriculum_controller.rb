class Painel::User::AcurriculumController < Painel::User::BaseController

  before_action :user_premium?, only: [:create]

  def index
    @curriculos = Curriculo.where(type_cv: 0).where(user_id: current_user.id)
  end

  def create
    @curriculo = Curriculo.new
    @curriculo.user_id = current_user.id
    respond_to do |f|
      if @curriculo.save
        f.html { redirect_to :back, notice: "Solicitação feita com sucesso, em breve você será informado!" }
      end
    end
  end

end