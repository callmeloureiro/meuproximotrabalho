class JobsController < BaseController

  before_filter :authenticate_user!, only: :apply

  def index
    @jobs = Job.aproved.where.not("contract LIKE ?", "%estagio%")
  end

  def show
    @job = Job.friendly.find(params[:id])
    @jobs = Job.aproved
  end

  def query
    @jobs = Job.aproved.where.not("contract LIKE ?", "%estagio%")
    @jobs = @jobs.where('title LIKE ? or name_offerer LIKE ?', "%#{params[:j]}%", "%#{params[:j]}%") if params[:j].present?
    @jobs = @jobs.where('zipcode LIKE ? or city LIKE ? or state LIKE ?', "%#{params[:c]}%", "%#{params[:c]}%", "%#{params[:c]}%") if params[:c].present?
    render :action => :index
  end

  def apply
    @user = User.find(current_user.id)
    @job = Job.friendly.find(params[:id])

    respond_to do |f| 
      if @user.job_applies.create(job: @job)
        NotificationMailer.candidata_perfil(@user, @job).deliver_now
        NotificationMailer.user_candidata(@user, @job).deliver_now
        f.html { redirect_to action: 'show' }
      end
    end
  end

  def removeapply
    @user = User.find(current_user.id)
    @job = Job.friendly.find(params[:id])
    respond_to do |f| 
      if @user.jobs_applies.delete(@job)
        f.html { redirect_to action: 'show' }
      end
    end
  end


end