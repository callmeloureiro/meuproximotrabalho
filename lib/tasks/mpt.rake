namespace :mpt do

  include Rails.application.routes.url_helpers
  default_url_options[:host] = ENV['DOMAIN_NAME']
  
  task :add_post => :environment do
    @jobs = Job.jobs_to_post
    @jobs.each do |j|
      j.posted = true
      if j.status == "Aprovado"
        j.posted_at = Time.zone.now
        # unless ENV['STAGE'] == "true"
        #   Pusher.trigger('notification_channel', 'job_event', {
        #     job_link: job_url(j.slug)
        #   })
        # end
      end
      j.save
    end
  end

  task :add_newsletter => :environment do
    domain = "http://marketing.meuproximotrabalho.com.br/api"
    token = ENV['MAUTIC_KEY']

    addlead = "#{domain}/leads/new?access_token=#{token}"
    @emails = User.where.not(confirmed_at: nil)
    @emails.each do |email|
      @response = HTTParty.post(addlead.to_str, 
        :body => { 
          :email => email.email
        }.to_json,
        :headers => { 'Content-Type' => 'application/json' } )
      @data = JSON.parse(@response.body)
      addleadcampain = "#{domain}/lists/6/lead/add/#{@data['lead']['id']}?access_token=#{token}"
      @response = HTTParty.post(addleadcampain.to_str)
    end
  end

  task :send_newsletter, [:response] => :environment do |t, args|
    @users = User.where.not(confirmed_at: nil)
    if args[:response] == 'domingo'
      @jobs = Job.aproved.where('posted_at >= ?', Time.zone.today.at_beginning_of_week)
    else
      @jobs = Job.aproved.where('posted_at >= ? AND posted_at <= ?', -1.day.from_now, Time.zone.now)
    end
    @users.each do |u|
      NotificationMailer.newsletter(u, @jobs).deliver_now
    end
  end

  task :send_vaga_fechada => :environment do
    @jobs = Job.aproved
    @jobs.each do |j|
      NotificationMailer.vaga_fechada(j).deliver_now
    end
  end

  task :pedido_abandonado => :environment do
    orders = Order.where(order_status: nil)
    orders.each do |o|
      user = User.find(o.user)
      o.created_at = o.created_at + 1.day
      if o.created_at >= Time.zone.now
        o.destroy
      end
    end
  end

end