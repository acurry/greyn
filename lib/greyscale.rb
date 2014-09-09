require 'chunky_png'

module Greyscale

    def self.col_lum(r, g, b)
        0.21*r + 0.72*g + 0.07*b
    end

    def self.col_avg(r, g, b)
        (r + g + b) / 3
    end

    def self.col_light(r, g, b)
        ([r,g,b].max + [r,g,b].min) / 2
    end

    def self.greyscale(img, f)
        width = img.width - 1
        height = img.height - 1

        for x in 0..width do
            for y in 0..height do
                col = self.send(f, ChunkyPNG::Color.r(img[x,y]), ChunkyPNG::Color.g(img[x,y]), ChunkyPNG::Color.b(img[x,y])).to_i
                img[x,y] = ChunkyPNG::Color.rgb(col, col, col)
            end
        end
    end

end

puts 'Path (press enter for Lenna): '
file = gets.chomp
path = "./assets/images"
file = path + "/Lenna.png" if file.empty?

filename = File.basename(file).split('.')[0]

[:col_avg, :col_light, :col_lum].each do |f|
  img = ChunkyPNG::Image::from_file(File.expand_path(file))
  Greyscale::greyscale(img, f)
  img.save(path + "/#{filename}_#{f.to_s}.png")
end