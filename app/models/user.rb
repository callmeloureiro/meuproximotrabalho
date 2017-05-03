class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :confirmable

  # devise :database_authenticatable

  has_many :jobs
  has_many :job_applies, :dependent => :destroy
  has_many :jobs_applies, through: :job_applies, source: :job
  has_many :orders
  has_many :curriculos

  has_attached_file :cv_pdf, 
    :path => ":rails_root/public/system/:attachment/:id/:basename.:extension",
    :url => "/system/:attachment/:id/:basename.:extension"
    
  validates_format_of :cv_pdf_file_name, 
    :with => /\.(docx|doc|pdf)\z/i,
    :allow_blank => true

  has_attached_file :avatar, 
    :path => ":rails_root/public/system/:attachment/:id/:basename_:style.:extension",
    :url => "/system/:attachment/:id/:basename_:style.:extension",
    :styles => {
      :thumb    => ['100x100#'],
      :preview  => ['480x480#',  :jpg, :quality => 70],
      :large    => ['600>',      :jpg, :quality => 70],
      :retina   => ['1200>',     :jpg, :quality => 30]
    },
    :convert_options => {
      :preview  => '-set colorspace sRGB -strip',
      :large    => '-set colorspace sRGB -strip',
      :retina   => '-set colorspace sRGB -strip -sharpen 0x0.5'
    },
    :default_url => :set_default_url
  
  validates_attachment :avatar,
    # :presence => true,
    :size => { :in => 0..10.megabytes },
    :content_type => { :content_type => /^image\/(jpeg|png|gif|tiff)$/ }

  validates_uniqueness_of :cpf,
    :allow_blank => true

  validates_uniqueness_of :cnpj,
    :allow_blank => true

  validates_uniqueness_of :email

  extend FriendlyId
  friendly_id :name, use: :slugged

  before_update :transform_to_slug, :if => :slug_changed?

  def transform_to_slug
    self.slug = self.slug.parameterize
  end

  def set_default_url
    "/assets/img/avatar.jpg"
  end

end
