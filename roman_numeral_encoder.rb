# Challenge: convert an integer into a Roman numeral
# eg "numeral(1990)" should convert to "MCMXC".

def numeral(number)
  symbols = [
    ["M", 1000],
    ["D", 500],
    ["C", 100],
    ["L", 50],
    ["X", 10],
    ["V", 5],
    ["I", 1]
  ]
  ans = ""
  symbols.each do |s|
    case (number - number % s[1])/s[1]
    when 4
      if ans[-1] == symbols[symbols.index(s) - 1][0]
        ans = ans[0..-2] + s[0] + symbols[symbols.index(s) - 2][0]
      else
        ans += s[0] + symbols[symbols.index(s) - 1][0]
      end
    else
      ans += s[0] * ((number - number % s[1])/s[1])
    end
    number -= number - number % s[1]
  end
  ans
end
