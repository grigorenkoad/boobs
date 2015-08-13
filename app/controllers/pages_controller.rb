class PagesController < ApplicationController
  require 'mechanize' 
  require'open-uri'
  require 'json'
  
  def home
    save_images
  end

  def refrash
    redirect_to :back
  end
  
  def save_images
    random = Random.new
    num = random.rand(0..30)

    response = open("http://api.oboobs.ru/boobs/#{num.to_s}/#{(num + 10).to_s}/rank").read
    boobs = JSON.parse(response)
    
    FileUtils.rm_rf(Dir.glob('images/*'))

    0.upto(10) do |i|
      open('images/' + boobs[i]["rank"].to_s + '_' + i.to_s + '.jpg', 'wb') do |file|
        file << open('http://media.oboobs.ru/' + boobs[i]["preview"]).read
      end
    end
  end
end
