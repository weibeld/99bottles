# First iteration, 4 June 2017:
#   - After 30 min reached completion of test "test_verse_0"
#   - Total time: 60 min
#
# 22.0: flog total
# 3.7: flog/method average
#
# 6.8: Bottles#verse                    lib/bottles.rb:17-19
# 5.0: Bottles#verses                   lib/bottles.rb:11-14
# 4.9: Bottles#n_bottles                lib/bottles.rb:24-33


class Bottles

  def song
    verses(99, 0)
  end

  def verses(from, to)
    from.downto(to).map { |n|
      verse(n)
    }.join("\n")
  end

  def verse(n)
<<-VERSE
#{n_bottles(n).capitalize} of beer on the wall, #{n_bottles(n)} of beer.
#{what_to_do_with(n)}, #{n_bottles(n-1)} of beer on the wall.
VERSE
  end

  def n_bottles(n)
    if n < 0
      "99 bottles"
    elsif n == 0
      "no more bottles"
    elsif n == 1
      "1 bottle"
    else
      "#{n} bottles"
    end
  end

  def what_to_do_with(n)
    if n == 0
      "Go to the store and buy some more"
    else
      "Take #{one_out_of(n)} down and pass it around"
    end
  end

  def one_out_of(n)
    if n == 1
      "it"
    else
      "one"
    end
  end

end
