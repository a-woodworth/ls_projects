# Using the each method, write some code to output all of the vowels from the strings.

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'],
      fourth: ['over', 'the', 'lazy', 'dog']}

vowels = 'aeiou'

hsh.each do |_, value|  # access the values (arrays)
  value.each do |str|   # access each string
    str.chars.each do |char|  # check characters to see if a vowel
      puts char if vowels.include?(char)
    end
  end
end

# e
# u
# i
# o
# o
# u
# e
# o
# e
# e
# a
# o
