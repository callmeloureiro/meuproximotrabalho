class FacebookPost < ActiveRecord::Base
  validates_uniqueness_of :id_face
end
