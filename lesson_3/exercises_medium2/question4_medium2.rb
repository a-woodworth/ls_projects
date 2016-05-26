# Question 4
# A quick glance at the docs for the Ruby String class will have you scratching your head over the absence of any "word iterator" methods.

# Our natural inclination is to think of the words in a sentence as a collection. We would like to be able to operate on those words the same way we operate on the elements of an array. Where are the String#each_word and the String#map_words methods?

# A common idiom used to solve this conundrum is to use the String#split in conjunction with Array#join methods to break our string up and then put it back together again.

# Use this technique to break up the following string and put it back together with the words in reverse order:

sentence = "Humpty Dumpty sat on a wall."

words = sentence.delete('.').split(' ') # exercise solution used .split(/\W/)
words.reverse!
reverse_sentence = words.join(' ').gsub(/[w]/, 'w' => 'W') + '.'

p reverse_sentence # "Wall a on sat Dumpty Humpty."