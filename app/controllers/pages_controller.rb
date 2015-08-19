class PagesController < ApplicationController
  require 'rmagick'
  require 'open-uri'
  require 'boobs'
  include Magick

  def home
    @title = "B(.)(.)BS"
    @boobs = get_old_img_with_rank()
  end

  def refresh
    @title = "B(.)(.)BS"
    @boobs = get_img_with_rank()
  end

end
