# What is the return value of map? Why?

{ a: 'ant', b: 'bear'}.map do |key, value|
  if value.size > 3
    value
  end
end

# Answer:
# => [nil, "bear"]

# The return value of map is an array, which is the collection type that map always returns. Here
# we get a nil for the first value because our if condition only evaluates to true when the length
# is greater than 3. 'bear' is greater than 3 but 'ant' is not so the condition will evaluate to
# false and value won't be returned.  When none of the condition in an if statement is evaluated,
# then the if statement returns nil.
