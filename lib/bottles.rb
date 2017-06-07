# Final solution (Chapter 6)
#
# 34.8: flog total
#  3.2: flog/method average
#
# 10.6: Bottles#verse                    lib/bottles.rb:11-18
#  5.4: Bottles::BottleNumber::for       lib/bottles.rb:25-35
#  5.0: Bottles#verses                   lib/bottles.rb:7-8

class Bottles

  def song
    verses(99, 0)
  end

  def verses(hi, lo)
    hi.downto(lo).collect {|n| verse(n)}.join("\n")
  end

  def verse(n)
    bottle_number = BottleNumber.for(n)

    "#{bottle_number.to_s.capitalize} of beer on the wall, " +
    "#{bottle_number} of beer.\n" +
    "#{bottle_number.action}, " +
    "#{bottle_number.successor} of beer on the wall.\n"
  end

  class BottleNumber
    attr_reader :n

    def self.for(n)
      case n
      when 0
        BottleNumber0
      when 1
        BottleNumber1
      when 6
        BottleNumber6
      else
        BottleNumber
      end.new(n)
    end

    def initialize(n)
      @n = n
    end

    def to_s
      "#{quantity} #{container}"
    end

    def container
      "bottles"
    end

    def pronoun
      "one"
    end

    def quantity
      n.to_s
    end

    def action
      "Take #{pronoun} down and pass it around"
    end

    def successor
      BottleNumber.for(n-1)
    end
  end

  class BottleNumber0 < BottleNumber
    def quantity
      "no more"
    end

    def action
      "Go to the store and buy some more"
    end

    def successor
      BottleNumber.for(99)
    end
  end

  class BottleNumber1 < BottleNumber
    def container
      "bottle"
    end

    def pronoun
      "it"
    end
  end

  class BottleNumber6 < BottleNumber
    def container
      "six-pack"
    end

    def quantity
      "1"
    end
  end

end
