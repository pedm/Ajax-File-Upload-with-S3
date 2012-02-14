class UploadsController < ApplicationController

  def create
    @upload = Upload.new(params[:upload])
    if @upload.save
      render :json => { :doc_path => @upload.document.url.to_s , :name => @upload.document.instance.attributes["document_file_name"] }, :content_type => 'text/html'
    else
      #todo handle error
      render :json => { :result => 'error'}, :content_type => 'text/html'
    end
  end
  
end