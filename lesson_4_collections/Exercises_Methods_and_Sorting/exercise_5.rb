# What does shift do in the following code? How can we find out?

hash = { a: 'ant', b: 'bear'}
hash.shift

# Answer:
# Hash shift removes a key-value pair from hsh and returns it as the two-item array -- [:a, "ant"] in
# this example -- or the hash's default value if the hash is empty -- nil.
