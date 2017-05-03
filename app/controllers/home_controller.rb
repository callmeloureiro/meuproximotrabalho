class HomeController < BaseController

  def index
    @jobs = Job.aproved
    @users = User.all

    # @posts = HTTParty.get("#{ENV['DOMAIN_BLOG']}/wp-json/wp/v2/posts?filter[posts_per_page]=3")
    # @posts = JSON.parse(@posts.body)
  end

end