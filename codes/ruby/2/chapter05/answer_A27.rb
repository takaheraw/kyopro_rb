def gcd(a, b)
  while a >= 1 && b >= 1
    if a >= b
      a = a % b
    else
      b = b % a
    end
  end

  if a >= 1
    a
  else
    b
  end
end

a, b = gets.split.map(&:to_i)
puts gcd(a, b)
