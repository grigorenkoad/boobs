class PagesController < ApplicationController
  require 'boobs_loader'
  require 'rmagick'
  require 'open-uri'
  include BoobsLoader
  include Magick

  def home
    @title = "B(.)(.)BS"
    @boobs = get_old_img_with_rank()
  end

  def refresh
    @title = "B(.)(.)BS"
    @boobs = get_img_with_rank
  end

end
