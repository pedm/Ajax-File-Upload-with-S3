class HomeController < ApplicationController  
  def index
    @upload  = Upload.new
    @uploads = Upload.all.reverse
  end
end
