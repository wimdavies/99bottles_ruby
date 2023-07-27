class Bottles
  def song
    verses(99, 0)
  end
  
  def verses(number1, number2)
    verse_string = ""

    (number2..number1).reverse_each do |number|
      verse_string << verse(number) + "\n"
    end

    verse_string.chomp
  end

  def verse(number)
    if number == 2
      "#{number} bottles of beer on the wall, " +
      "#{number} bottles of beer.\n" +
      "Take one down and pass it around, " +
      "#{number - 1} bottle of beer on the wall.\n"
    elsif number == 1
      "1 bottle of beer on the wall, " +
      "1 bottle of beer.\n" +
      "Take it down and pass it around, " +
      "no more bottles of beer on the wall.\n"
    elsif number == 0
      "No more bottles of beer on the wall, " +
      "no more bottles of beer.\n" +
      "Go to the store and buy some more, " +
      "99 bottles of beer on the wall.\n"
    else
      "#{number} bottles of beer on the wall, " +
      "#{number} bottles of beer.\n" +
      "Take one down and pass it around, " +
      "#{number - 1} bottles of beer on the wall.\n"      
    end
  end
end