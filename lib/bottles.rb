class Bottles
  def song
    verses(99, 0)
  end
  
  def verses(higher_number, lower_number)
    higher_number.downto(lower_number).map {|number| verse(number)}.join("\n")
  end

  def verse(number)
    "#{quantity(number).capitalize} #{container(number)} of beer on the wall, " +
    "#{quantity(number)} #{container(number)} of beer.\n" +
    "#{instruction(number)}, " +
    "#{quantity(successor(number))} #{container(successor(number))} of beer on the wall.\n"
  end

  def instruction(number)
    BottleNumber.new(number).instruction
  end

  def container(number)
    BottleNumber.new(number).container
  end

  def pronoun(number)
    BottleNumber.new(number).pronoun
  end

  def quantity(number)
    BottleNumber.new(number).quantity
  end

  def successor(number)
    BottleNumber.new(number).successor
  end
end

class BottleNumber
  attr_reader :number
  def initialize(number)
    @number = number
  end
  
  def quantity
    if number == 0
      'no more'
    else
      number.to_s
    end
  end

  def container
    if number == 1
      'bottle'
    else
      'bottles'
    end
  end

  def instruction
    if number == 0
      "Go to the store and buy some more"
    else
      "Take #{pronoun} down and pass it around"
    end
  end

  def pronoun
    if number == 1
      'it'
    else
      'one'
    end
  end

  def successor
    if number == 0
      99
    else
      number - 1
    end
  end
end