class Painel::User::JobsController < Painel::User::BaseController

  before_action :set_job, only: [:edit, :update, :destroy, :subscribers]

  def index
    @jobs = Job.where(user_id: current_user.id)
    if params[:status] == 'aguardando-aprovacao'
      @jobs = Job.where(user_id: current_user.id).where('status = 0')
    end
    if params[:status] == 'aprovados'
      @jobs = Job.where(user_id: current_user.id).where('status = 1')
    end
    if params[:status] == 'nao-aprovados'
      @jobs = Job.where(user_id: current_user.id).where('status = 2')
    end
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(jobs_params)
    @job.user_id = current_user.id
    unless @job.schedule_type
      @job.posted = true
      # @job.posted_at = DateTime.now
    end
    respond_to do |f|
      if @job.save
        if @job.user.user_verify
          @job.job_verify = true
          @job.save
        else
          NotificationMailer.confirm_job(@job).deliver_now
        end
        f.html { redirect_to edit_painel_user_job_url(@job), :flash => { :notice => "Vaga criada com sucesso!" } }
      else
        f.html { render action: 'new' }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |f|
      if @job.update(jobs_params)
        f.html { redirect_to edit_painel_user_job_url(@job), :flash => { :notice => "Vaga atualizada com sucesso!" } }
      else
        f.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @job.destroy
    respond_to do |f|
      f.html { redirect_to painel_user_jobs_url, notice: "Trabalho deletado com sucesso." }
    end
  end

  def subscribers
    @subscribers = @job.users_applies
  end

  private

    def set_job
      @job = Job.friendly.find(params[:id])
    end

    def jobs_params
      list_params_allowed = [:title, :name_offerer, :zipcode, :city, :state, :district, :address, :complement, :workload, :price, :type_offer, :experience, :occupation, :office, :description, :responsibilities, :requirements, :differential, :logo, :email, :closed, :owner, :contract, :scholarity, :schedule_type, :schedule_time, :number]
      # list_params_allowed << :status if current_user.admin?
      params.require(:job).permit(list_params_allowed)
    end

end