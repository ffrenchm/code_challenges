# Challenge: create a method which takes an integer as input
# and converts to from the source base system to the target.
# for example "convert(101, bin, dec)" would convert 101 from
# binary to decimal. It should evaluate to 5.

bin = '01'
oct = '01234567'
dec = '0123456789'
hex = '0123456789abcdef'
allow = 'abcdefghijklmnopqrstuvwxyz'
allup = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
alpha = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
alphanum = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'

def convert(input, source, target)
  # first convert source to dec if source isn't dec
  if source != '0123456789'
    src = source.split('')
    inp = input.split('')
    i = inp.length
    
    dec_ans = inp.inject(0) do |sum, n|
      i -= 1
      sum += src.index(n) * src.length**i
    end
  else
    dec_ans = input.to_i
  end
  
  return dec_ans.to_s if target == '0123456789'
  return target[0] if dec_ans == 0
  
  # then convert dec to target
  base = target.length
  div = dec_ans
  ans = []
  while div > 0 do
    ans << target[div % base]
    div = (div - (div % base))/base
  end
  ans.reverse.join
end
