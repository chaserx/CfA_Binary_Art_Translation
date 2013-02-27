# 2.27.2013
# Chase Southard
# Translate the Binary Art from the Code for America posters.
# http://codeforamerica.org/binary-art/
#
# Usage
# @quote = CfaBinaryArtTranslation.new(quote: "1010101 1010011 1000001")
# @quote.translate_to_ascii
# => USA

class CfaBinaryArtTranslation
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

quote_string = "01010111 01100101 00100000 01110100 01101000 01100101 
                00100000 01010000 01100101 01101111 01110000 01101100 
                01100101 00100000 01101111 01100110 00100000 01110100 
                01101000 01100101 00100000 01010101 01101110 01101001 
                01110100 01100101 01100100 00100000 01010011 01110100 
                01100001 01110100 01100101 01110011 00101100 00100000 
                01101001 01101110 00100000 01001111 01110010 01100100 
                01100101 01110010 00100000 01110100 01101111 00100000 
                01100110 01101111 01110010 01101101 00100000 01100001 
                00100000 01101101 01101111 01110010 01100101 00100000 
                01110000 01100101 01110010 01100110 01100101 01100011 
                01110100 00100000 01010101 01101110 01101001 01101111 
                01101110"

@madison = CfaBinaryArtTranslation.new(quote: quote_string)
puts @madison.translate_to_ascii

# => "We the People of the United States, in Order to form a more perfect Union"
