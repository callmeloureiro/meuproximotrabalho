class PageController < BaseController

  def companies

  end

  def maintenance

  end

  def contact

  end

  def premium
    if current_user
      HTTParty.post("https://us13.api.mailchimp.com/3.0/lists/b367a0e99e/members/",
      { 
        :body =>
        {
          "email_address": "#{current_user.email}",
          "status": "subscribed",
          "merge_fields": {
              "FNAME": "#{current_user.name}"
          }
        }.to_json,
        :basic_auth => { :username => "mathloureiro", :password => "611dc30c69d28a7c5792285d958a8e79-us13" },
        :headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json'}
      })
    end
  end

end