namespace :facebook do

  task :add_post_lou => :environment do
    @graph = Koala::Facebook::API.new(ENV['FB_KEY_LOU'])
    @post = FacebookPost.where(:posted => false).where(:type_post => 0).order('id DESC').take(1)
    unless @post.blank?
      @post.each do |p|
        @graph.put_connections(1724371901154391, "feed", :message => p.content)
        p.posted = true
        p.save
      end
    end
  end

  task :add_post_ana => :environment do
    # @graph = Koala::Facebook::API.new(ENV['FB_KEY_CLAUDIA'])
    @graph = Koala::Facebook::API.new(ENV['FB_KEY_MARA'])
    @post = FacebookPost.where(:posted => false).where(:type_post => 0).order('id DESC').take(1)
    unless @post.blank?
      @post.each do |p|
        @graph.put_connections(1724371901154391, "feed", :message => p.content)
        p.posted = true
        p.save
      end
    end
  end

  task :add_post => :environment do
    groups = [
      237750209672630, 
      133040390153103, 
      127368330756524, 
      680967695282031, 
      876109439129063, 
      231540093563899, 
      1582545621998981, 
      236171439907121, 
      383896475049499, 
      519878758140925, 
      1637985636438351,
      1653935678203218,
      321307524696772,
      300015953461882,
      896143997085949,
      123657174510412,
      1532516153628986,
      465274203574965,
      1540991579493966,
      216432245177443,
      286755908152731,
      1414451718772085,
      191048901078246,
      519731548116134,
      403109629725728,
      290824364363174,
      136856333132438,
      392071410838621,
      263809860396956,
      535461529890384,
      240577232694581,
      691675327555622,
      192868074235521,
      1411679802396997,
      368175829942212,
      1414380995490885,
      1703831669853453,
      403393579823857,
      1422854834604498,
      910054872403856,
      1686362438259940,
      118334668266162,
      891487130902613,
      1489038237982533,
      123426491149567
    ]

    groups.each do |group|
      url = "https://graph.facebook.com/v2.0/#{group}/feed?fields=message&access_token=#{ENV['FB_KEY_LOU']}"
      @response = HTTParty.get(url)
      @response = JSON.parse(@response.body)

      unless @response['error'].blank?
        url = "https://graph.facebook.com/v2.0/#{group}/feed?fields=message&access_token=#{ENV['FB_KEY_CLAUDIA']}"
        @response = HTTParty.get(url)
        @response = JSON.parse(@response.body)
      end

      @response["data"].each do |r|
        unless r["message"].to_s.scan(/\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i).blank?
          @post = FacebookPost.new
          @post.content = r["message"]
          @post.id_face = r["id"]
          @post.email_empresa = r["message"].scan(/\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i).to_s.downcase.delete '"[]"'
          if r["message"].to_s.downcase.include?('clique na imagem')
            @post.posted = true
          end
          @post.save 
        end
      end
    end
  end
end