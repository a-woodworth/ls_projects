# Add up all of the ages from the Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237}


# My Solution
total = ages.values.inject(:+)
p total
# => 6174

# Alternate Solution
total_ages = 0
ages.each { |_, age| total_ages += age }
p total_ages
