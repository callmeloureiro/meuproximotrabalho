class Painel::User::GcurriculumController < Painel::User::BaseController

  before_action :user_premium?, only: [:create]

  def index
    @curriculos = Curriculo.where(type_cv: 1).where(user_id: current_user.id)
  end

  def create
    @curriculo = Curriculo.new
    @curriculo.user_id = current_user.id
    @curriculo.type_cv = 1
    respond_to do |f|
      if @curriculo.save
        CurriculumMailer.generate_cv(params[:nome], params[:naturalidade], params[:civil], params[:idade], params[:endereco], params[:numero], params[:complemento], params[:bairro], params[:cidade], params[:estado], params[:telefone], params[:email], params[:objetivo], params[:formacao], params[:experiencias], params[:qualificacoes], params[:informacoes]).deliver_now
        f.html { redirect_to :back, notice: "Solicitação feita com sucesso, em breve você será informado!" }
      end
    end
  end

end