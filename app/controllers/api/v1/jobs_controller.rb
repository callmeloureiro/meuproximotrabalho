class Api::V1::JobsController < Api::V1::BaseController

  def index
    @jobs = Job.all
    @jobs = @jobs.select(:city).uniq if params[:cities_uniq].present?
    render :json => @jobs
  end

end