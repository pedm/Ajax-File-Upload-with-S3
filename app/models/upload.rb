class Upload < ActiveRecord::Base
  #after_update :reprocess_picture, :if => :cropping?
  
  has_attached_file :picture, :styles => {   }
  
  validates_attachment_presence :picture
  validates_attachment_size :picture, :less_than => 50000.megabytes
  validates_attachment_content_type :picture, :content_type => [ 'image/jpeg', 'image/png', 'image/pjpeg' ]
  
  MAX_CROP_WIDTH = 500
  PREVIEW_WIDTH  = 100
  PREVIEW_HEIGHT = 100
  
end
