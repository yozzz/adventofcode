# Now, a nice string is one with all of the following properties:

# - It contains a pair of any two letters that appears at least twice
#   in the string without overlapping, like xyxy (xy) or aabcdefgaa (aa),
#   but not like aaa (aa, but it overlaps).

# - It contains at least one letter which repeats with exactly one
#   letter between them, like xyx, abcdefeghi (efe), or even aaa.

# For example:

# - qjhvhtzxzqqjkmpb is nice because it has a pair that appears twice (qj)
#   and a letter that repeats with exactly one letter between them (zxz).

# - xxyxx is nice because it has a pair that appears twice
#   and a letter that repeats with one between,
#   even though the letters used by each rule overlap.

# - uurcxstgmygtbstg is naughty because it has a pair (tg)
#   but no repeat with a single letter between them.

# - ieodomkazucvgmuy is naughty because it has a repeating letter
#   with one between (odo), but no pair that appears twice.

# How many strings are nice under these new rules?


file_path = File.join(File.dirname(__FILE__), 'input.txt')
strings = File.open(file_path, 'r').read

strings = strings.split("\n")

nice = 0

strings.each do |string|
  duplicated_pairs = 0
  seen_pairs = {}

  (0..string.length - 2).each do |i|
    pair = string[i, 2]

    if seen_pairs[pair].nil?
      seen_pairs[pair] = i
    elsif i - seen_pairs[pair] > 1
      duplicated_pairs +=1
      # puts "#{pair} in string #{string}"
    end
  end

  chars = string.chars
  repeated_char = 0
  chars.each_with_index do |char, i|
    if i < chars.length - 2 && char == chars[i + 2]
      repeated_char += 1
    end
  end


  if duplicated_pairs > 0 && repeated_char > 0
    nice += 1
    puts "Duplicated pairs #{duplicated_pairs}"
    puts "Repeated chars #{repeated_char}"
    puts "-----------------------------------"
    puts "Nice string - #{string}"
  end


  ## First Part
  ## vowels = %w[a e i o u]
  ## bad_strings = %w[ab cd pq xy]
  # vowels_in_str = 0
  # doubles = 0
  #
  # next if bad_strings.any? { |bs| string.include? bs }
  #
  # chars = string.chars
  # chars.each_with_index do |char, i|
  #   vowels_in_str += 1 if vowels.include?(char)
  #   doubles += 1 if i < chars.length - 1 && char == chars[i+1]
  # end
  #
  # nice += 1 if vowels_in_str >= 3 && doubles >= 1
end

puts nice
