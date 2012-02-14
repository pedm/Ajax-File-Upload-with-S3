class UploadsController < ApplicationController
  
  def show
    @upload = Upload.find(params[:id])
  end

  def create
    @upload = Upload.new(params[:upload])
    if @upload.save
      render :json => { :pic_path => @upload.document.url.to_s , :name => @upload.document.instance.attributes["document_file_name"] }, :content_type => 'text/html'
    else
      #todo handle error
      render :json => { :result => 'error'}, :content_type => 'text/html'
    end
  end
  
  def update
    @upload = Upload.find(params[:id])
    if @upload.update_attributes(params[:upload])
      flash[:notice] = "Successfully updated document."
      redirect_to root_path
    end
  end

  def show_pic
    @upload = current_document
    geo = Paperclip::Geometry.from_file(@upload.document.to_file(:original))
    @adapter = geo.width > Upload::MAX_CROP_WIDTH.to_f ? geo.width/Upload::MAX_CROP_WIDTH.to_f : 1
    @width = geo.width
    @height = geo.height
  end

  def show_crop
    @upload = current_document
  end
  
  def current_document
    Upload.last #to change according to what you expect, example: current_user.avatar
  end

end