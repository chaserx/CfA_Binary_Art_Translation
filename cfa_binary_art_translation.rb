# 2.27.2013
# Chase Southard
# Translate the Binary Art from the Code for America posters.
# http://codeforamerica.org/binary-art/
#
# Usage
# @quote = CfABinaryArtTranslation.new(quote: "1010101 1010011 1000001")
# @quote.translate_to_ascii
# => USA

class CfABinaryArtTranslation
  attr_accessor :quote

  def initialize(args)
    @quote = args[:quote]
  end

  # call the binary litteral array and return the ascii equivalent string
  def translate_to_ascii
    character_array = []
    binary_literalize.each do |x|
      character_array << x.to_i(2).chr
    end
    character_array.join
  end

  private

  # prepend 0b to ensure a ruby binary litreral
  def binary_literalize
    quote_array = @quote.split
    quote_array.each do |e|
      e.prepend('0b')
    end
    quote_array
  end
end

# Alrighty

# http://codeforamerica.org/wp-content/uploads/2010/06/madison.pdf

@quote = CfABinaryArtTranslation.new(quote: File.read('binary_art/madison.txt'))
puts @quote.translate_to_ascii

# => "We the People of the United States, in Order to form a more perfect Union"
