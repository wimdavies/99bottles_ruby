class Bottles
  def song
    verses(99, 0)
  end
  
  def verses(higher_number, lower_number)
    higher_number.downto(lower_number).map {|number| verse(number)}.join("\n")
  end

  def verse(number)
    bottle_number = BottleNumber.for(number)

    "#{bottle_number} of beer on the wall, ".capitalize +
    "#{bottle_number} of beer.\n" +
    "#{bottle_number.instruction}, " +
    "#{bottle_number.successor} of beer on the wall.\n"
  end
end

class BottleNumber
  def self.for(number)
    case number
    when 0
      BottleNumber0
    when 1
      BottleNumber1
    else
      BottleNumber
    end.new(number)
  end
  
  attr_reader :number
  def initialize(number)
    @number = number
  end

  def to_s
    "#{quantity} #{container}"
  end
  
  def quantity
    number.to_s
  end

  def container
    'bottles'
  end

  def instruction
    "Take #{pronoun} down and pass it around"
  end

  def pronoun
    'one'
  end

  def successor
    BottleNumber.for(number - 1)
  end
end

class BottleNumber0 < BottleNumber
  def quantity
    'no more'
  end

  def instruction
    "Go to the store and buy some more"
  end

  def successor
    BottleNumber.for(99)
  end
end

class BottleNumber1 < BottleNumber
  def container
    'bottle'
  end

  def pronoun
    'it'
  end
end