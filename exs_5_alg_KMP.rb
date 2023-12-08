def compute_prefix_function(pattern)
  m = pattern.length
  pi = Array.new(m, 0)
  k = 0

  (1...m).each do |q|
    while k > 0 && pattern[k] != pattern[q]
      k = pi[k - 1]
    end

    if pattern[k] == pattern[q]
      k += 1
    end

    pi[q] = k
  end

  pi
end

def kmp_search(text, pattern)
  n = text.length
  m = pattern.length
  pi = compute_prefix_function(pattern)
  q = 0
  positions = []

  (0...n).each do |i|
    while q > 0 && pattern[q] != text[i]
      q = pi[q - 1]
    end

    if pattern[q] == text[i]
      q += 1
    end

    if q == m
      positions << i - m + 1
      q = pi[q - 1]
    end
  end

  positions
end

# Приклад використання
text = "ABABDABACDABABCABAB"
pattern = "ABABCABAB"
result = kmp_search(text, pattern)
puts "Знайдені позиції: #{result}"
