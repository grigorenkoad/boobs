class PagesController < ApplicationController
  require 'rmagick'
  require 'open-uri'
  require 'boobs'
  include Magick

  def home
    @qwe = "B(.)(.)BS"
    @boobs = get_img_with_rank()
  end

end
