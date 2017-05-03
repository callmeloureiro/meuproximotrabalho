class Painel::User::HomeController < Painel::User::BaseController

  def index
    @userjobs = current_user.job_applies.order('created_at DESC')
    @jobs = Job.all
  end

end