# ---Day 5 : Doesn 't He Have Intern-Elves For This? ---
# Santa needs help figuring out which strings in his text file are naughty or nice.
#
# A nice string is one with all of the following properties:
#
# It contains at least three vowels (aeiou only), like aei, xazegov, or aeiouaeiouaeiou.
# It contains at least one letter that appears twice in a row, like xx, abcdde (dd), or aabbccdd (aa, bb, cc, or dd).
# It does not contain the strings ab, cd, pq, or xy, even if they are part of one of the other requirements.
# For example:
#
# ugknbfddgicrmopn is nice because it has at least three vowels (u...i...o...), a double letter (...dd...), and none of the disallowed substrings.
# aaa is nice because it has at least three vowels and a double letter, even though the letters used by different rules overlap.
# jchzalrnumimnmhp is naughty because it has no double letter.
# haegwjzuvuyypxyu is naughty because it contains the string xy.
# dvszwmarrgswjxmb is naughty because it contains only one vowel.
# How many strings are nice?



file_path = File.join(File.dirname(__FILE__), 'input2.txt')
strings = File.open(file_path, 'r').read

strings = strings.split("\n")

# vowels = %w[a e i o u]
# bad_strings = %w[ab cd pq xy]
nice = 0

strings.each do |string|
  duplicated_pairs = 0
  seen_pairs = {}

  (0..string.length - 2).each do |i|
    pair = string[i, 2]
    next if pair[0] != pair[1]

    if seen_pairs[pair].nil?
      seen_pairs[pair] = i
    elsif i - seen_pairs[pair] > 1
      duplicated_pairs +=1
      puts "#{pair} in string #{string}"
    end
  end

  puts "Duplicated pairs #{duplicated_pairs}"

  chars = string.chars
  repeated_char = 0
  chars.each_with_index do |char, i|
    if i < chars.length - 2 && char == chars[i + 2]
      repeated_char += 1
    end
  end

  puts "Repeated chars #{repeated_char}"

  if duplicated_pairs > 0 && repeated_char > 0
    nice += 1
    puts "Nice string - #{string}"
  end


  ## First Part
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






