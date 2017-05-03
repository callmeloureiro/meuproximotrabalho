class InternshipsController < BaseController

  def index
    @jobs = Job.aproved.where('contract LIKE ?', "%estagio%")
  end

  def query
    @jobs = Job.aproved.where('contract LIKE ?', "%estagio%")
    @jobs = @jobs.where('title LIKE ? or name_offerer LIKE ?', "%#{params[:j]}%", "%#{params[:j]}%") if params[:j].present?
    @jobs = @jobs.where('zipcode LIKE ? or city LIKE ? or state LIKE ?', "%#{params[:c]}%", "%#{params[:c]}%", "%#{params[:c]}%") if params[:c].present?
    render :action => :index
  end

end