namespace :mautic do
  task :add_lead => :environment do
    domain = "http://marketing.meuproximotrabalho.com.br/api"
    token = ENV['MAUTIC_KEY']

    addlead = "#{domain}/leads/new?access_token=#{token}"
    @emails = FacebookPost.where(:integrate => false).where(:type_post => 0)
    @emails.each do |email|
      @response = HTTParty.post(addlead.to_str, 
        :body => { 
          :email => email.email_empresa
        }.to_json,
        :headers => { 'Content-Type' => 'application/json' } )
      email.integrate = true
      email.save
      @data = JSON.parse(@response.body)
      addleadcampain = "#{domain}/lists/1/lead/add/#{@data['lead']['id']}?access_token=#{token}"
      @response = HTTParty.post(addleadcampain.to_str)
    end

    @emails = FacebookPost.where(:integrate => false).where(:type_post => 1)
    @emails.each do |email|
      @response = HTTParty.post(addlead.to_str, 
        :body => { 
          :email => email.email_user
        }.to_json,
        :headers => { 'Content-Type' => 'application/json' } )
      email.integrate = true
      email.save
      @data = JSON.parse(@response.body)
      addleadcampain = "#{domain}/lists/3/lead/add/#{@data['lead']['id']}?access_token=#{token}"
      @response = HTTParty.post(addleadcampain.to_str)
    end
  end
end