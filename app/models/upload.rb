class Upload < ActiveRecord::Base
  #after_update :reprocess_document, :if => :cropping?
  
  has_attached_file :document, :styles => {   }
  
  validates_attachment_presence :document
  validates_attachment_size :document, :less_than => 50000.megabytes
  validates_attachment_content_type :document, :content_type => [ 'image/jpeg', 'image/png', 'image/pjpeg' ]
  
  MAX_CROP_WIDTH = 500
  PREVIEW_WIDTH  = 100
  PREVIEW_HEIGHT = 100
  
end
