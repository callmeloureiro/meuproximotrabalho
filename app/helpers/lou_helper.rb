module LouHelper
  def featured_media(id, size)
    featured = HTTParty.get("#{ENV['DOMAIN_BLOG']}/wp-json/wp/v2/media/#{id}")
    featured = JSON.parse(featured.body)
    featured = featured["media_details"]["sizes"]["#{size}"]["source_url"]
  end

  def title_page
    name = "Meu Próximo Trabalho"
    case controller_name
    when "search"
      title_page = "Sua pesquisa retornou #{@jobs.count} resultado(s) - #{name}"
    when "jobs", "internships"
      if params[:action] == "show"
        title_page = "#{@job.title} - #{name}"
      else
        title_page = "Sua pesquisa retornou #{@jobs.count} resultado(s) - #{name}"
      end
    else
      title_page = "#{name} - Procurou, achou."
    end
  end
end