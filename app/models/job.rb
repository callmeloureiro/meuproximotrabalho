class Job < ActiveRecord::Base
  belongs_to :user
  
  has_many :job_applies, :dependent => :destroy
  has_many :users_applies, through: :job_applies, source: :user

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  # Paperclip gem options
  has_attached_file :logo, 
  :path => ":rails_root/public/system/:attachment/:id/:basename_:style.:extension",
  :url => "/system/:attachment/:id/:basename_:style.:extension",
  :styles => {
    :thumb    => "100x",
    :preview  => ['480x480#',  :jpg, :quality => 70],
    :large    => ['600>',      :jpg, :quality => 70],
    :retina   => ['1200>',     :jpg, :quality => 30]
  },
  :convert_options => {
    :thumb    => '-set colorspace sRGB -strip',
    :preview  => '-set colorspace sRGB -strip',
    :large    => '-set colorspace sRGB -strip',
    :retina   => '-set colorspace sRGB -strip -sharpen 0x0.5'
  },
  :default_url => "/assets/img/:style/default.jpg"
  
  validates_attachment :logo,
    # :presence => true,
    :size => { :in => 0..10.megabytes },
    :content_type => { :content_type => /^image\/(jpeg|png|gif|tiff)$/ 
  }

  validates :title, :name_offerer, :email, :description, :city, :state, :presence => true

  enum status: ['Aguardando aprovação', 'Aprovado', 'Não aprovado']  

  def slug_candidates
    [
      [:name_offerer, :title],
      [:name_offerer, :title, "#{self.class.where(title: title).count + 1}"]
    ]
  end

  def should_generate_new_friendly_id?
    new_record? || slug.blank?
  end

  def price=(val)
    val.sub!(',', '.') if val.is_a?(String)
    self['price'] = val
  end

  #Scope Jobs to post
  scope :jobs_to_post, -> do 
    where(:posted => false).where(:schedule_type => true).where('? >= schedule_time', Time.zone.now)
  end

  scope :aproved, -> do
    where(:posted => true).where(:status => "Aprovado").where(:closed => false)
  end

  scope :job_today, -> {
    where('posted_at >= ?', Time.zone.now.beginning_of_day)
  }

  scope :job_week, -> {
    where('posted_at >= ?', Time.zone.today.at_beginning_of_week)
  }

  scope :job_month, -> {
    where('posted_at >= ?', Time.zone.today.at_beginning_of_month)
  }


end
