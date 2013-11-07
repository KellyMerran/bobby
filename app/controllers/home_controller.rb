class HomeController < ApplicationController

  def index
  	@no_nav = true
  	@color_container = true
  	@triangle_background=true
  end

  def login
  	@triangle_background=true
  end

end
