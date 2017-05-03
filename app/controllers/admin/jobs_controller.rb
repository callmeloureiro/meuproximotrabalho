class Admin::JobsController < Admin::BaseController

  before_action :set_jobs, only: [:show, :edit, :update, :destroy]

  def index
    @jobs = Job.all
    @jobs = @jobs.where(:status => 2) if params[:status] == 'nao-aprovados'
    @jobs = @jobs.where(:status => 1) if params[:status] == 'aprovados'
    @jobs = @jobs.where(:status => 0) if params[:status] == 'aguardando-aprovacao'
    @jobs = @jobs.where(:schedule_type => 1).where(:posted => false) if params[:status] == 'agendados'
  end

  def show

  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(jobs_params)
    @job.user_id = current_user.id
    unless @job.schedule_type
      @job.posted = true
    end
    respond_to do |f|
      if @job.save
        f.html { redirect_to edit_admin_job_path(@job), notice: 'Job was successfully created.' }
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
        f.html { redirect_to admin_jobs_url, notice: 'Job was successfully updated.' }
      else
        f.html { render action: 'edit' }
      end
    end
  end

  def destroy

  end

  def approved
    @job = Job.friendly.find(params[:job_id])
    respond_to do |f|
      if @job.update(jobs_params)
        if @job.status == "Aprovado" && @job.posted?
          @job.posted_at = Time.zone.now
          @job.save
          # unless ENV["STAGE"] == "true"
          #   Pusher.trigger('notification_channel', 'job_event', {
          #     job_link: job_url(@job.slug)
          #   })
          # end
        end
        f.html { redirect_to admin_jobs_url, notice: 'Job was successfully updated.' }
      else
        f.html { render action: 'edit' }
      end
    end
  end

  private
    def set_jobs
      @job = Job.friendly.find(params[:id])
    end

    def jobs_params
      params.require(:job).permit(:title, :name_offerer, :zipcode, :city, :state, :district, :address, :complement, :workload, :price, :type_offer, :experience, :occupation, :office, :description, :responsibilities, :requirements, :differential, :logo, :email, :closed, :owner, :contract, :status, :scholarity, :schedule_time, :schedule_type, :number, :job_verify, :end_date, :end_date_type)
    end

end