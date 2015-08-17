require 'open-uri'
require 'rmagick'
include Magick

def save_img
  random = Random.new
  start = random.rand(0..100)

  response = open("http://api.oboobs.ru/boobs/#{start}/10/rank").read
  boobs = JSON.parse(response)

  FileUtils.rm_rf(Dir["public/images/*"])

  boobs.each_with_index do |img, index|
    open('public/images/' + img["rank"].to_s + '_' + index.to_s + '.jpg', 'wb') do |file|
      file << open('http://media.oboobs.ru/' + img["preview"]).read
    end
  end
end

def get_img
  save_img()
  boobs = Dir["public/images/*.jpg"]
end

def get_img_with_rank
  drow_rank()
  boobs_with_rank = Dir["public/images/*.png"]
end

def drow_rank
  boobs = get_img()

    boobs.each_with_index do |img, index|
      image = ImageList.new(img)
      txt = Draw.new

      image.annotate(txt, 0,0,0,0, img[15..-7].to_s){
        txt.gravity = Magick::SouthGravity
        txt.pointsize = 25
        txt.stroke = '#000000'
        txt.fill = '#ffffff'
        txt.font_weight = Magick::BoldWeight
      }
      image.format = 'png'
      open('public/images/' + img["rank"].to_s + '_' + index.to_s + '.png', 'wb') do |file|
        file << image.to_blob
      end 
    end  
end