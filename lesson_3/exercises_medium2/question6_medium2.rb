# Question 6
# One day Spot was playing with the Munster family's home computer and he wrote a small program to mess with their demographic data:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end
# After writing this method, he typed the following...and before Grandpa could stop him, he hit the Enter key with his tail:
puts "Here's the original hash data."
p munsters

mess_with_demographics(munsters)

puts "Here's the munsters hash now after this destructive method altered the data."
p munsters
# Did the family's data get ransacked, or did the mischief only mangle a local copy of the original hash? (why?)
puts "Answer: That sneaky Spot messed with their original data and replaced it permanently with the revised values."

## Way to fix:
# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

# def mess_with_demographics(demo_hash)
#   safe_hash = Marshal.load(Marshal.dump(demo_hash))

#   safe_hash.values.each do |family_member|
#     family_member["age"] += 42
#     family_member["gender"] = "other"
#   end

#   safe_hash
# end

# altered_hash = mess_with_demographics(munsters)

# munsters
# => {"Herman"=>{"age"=>32, "gender"=>"male"}, "Lily"=>{"age"=>30, "gender"=>"female"}, "Grandpa"=>{"age"=>402, "gender"=>"male"}, "Eddie"=>{"age"=>10, "gender"=>"male"}, "Marilyn"=>{"age"=>23, "gender"=>"female"}}

# altered_hash
# => {"Herman"=>{"age"=>74, "gender"=>"other"}, "Lily"=>{"age"=>72, "gender"=>"other"}, "Grandpa"=>{"age"=>444, "gender"=>"other"}, "Eddie"=>{"age"=>52, "gender"=>"other"}, "Marilyn"=>{"age"=>65, "gender"=>"other"}}
