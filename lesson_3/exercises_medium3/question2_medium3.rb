# def fun_with_ids
#   a_outer = 42
#   b_outer = "forty two"
#   c_outer = [42]
#   d_outer = c_outer[0]

#   a_outer_id = a_outer.object_id
#   b_outer_id = b_outer.object_id
#   c_outer_id = c_outer.object_id
#   d_outer_id = d_outer.object_id

#   puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block."
#   puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block."
#   puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block."
#   puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block.\n\n"

#   an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)


#   puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the method call."
#   puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the method call."
#   puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the method call."
#   puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the method call.\n\n"

#   puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
#   puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
#   puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
#   puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the method.\n\n" rescue puts "ugh ohhhhh"
# end


# def an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)
#   a_outer_inner_id = a_outer.object_id
#   b_outer_inner_id = b_outer.object_id
#   c_outer_inner_id = c_outer.object_id
#   d_outer_inner_id = d_outer.object_id

#   puts "a_outer id was #{a_outer_id} before the method and is: #{a_outer.object_id} inside the method."
#   puts "b_outer id was #{b_outer_id} before the method and is: #{b_outer.object_id} inside the method."
#   puts "c_outer id was #{c_outer_id} before the method and is: #{c_outer.object_id} inside the method."
#   puts "d_outer id was #{d_outer_id} before the method and is: #{d_outer.object_id} inside the method.\n\n"

#   a_outer = 22
#   b_outer = "thirty three"
#   c_outer = [44]
#   d_outer = c_outer[0]

#   puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."
#   puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."
#   puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."
#   puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after.\n\n"


#   a_inner = a_outer
#   b_inner = b_outer
#   c_inner = c_outer
#   d_inner = c_inner[0]

#   a_inner_id = a_inner.object_id
#   b_inner_id = b_inner.object_id
#   c_inner_id = c_inner.object_id
#   d_inner_id = d_inner.object_id

#   puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the method (compared to #{a_outer.object_id} for outer)."
#   puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the method (compared to #{b_outer.object_id} for outer)."
#   puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the method (compared to #{c_outer.object_id} for outer)."
#   puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the method (compared to #{d_outer.object_id} for outer).\n\n"
# end

# p fun_with_ids
p "This one is the same as it was before in Q1."
p "a_outer is 42 with an id of: 85 before the block."
p "b_outer is forty two with an id of: 70103278585640 before the block."
p "c_outer is [42] with an id of: 70103278585620 before the block."
p "d_outer is 42 with an id of: 85 before the block."
p "-----------------------------------------------------"
p "This one is also the same as it was before in Q1."
p "a_outer id was 85 before the method and is: 85 inside the method."
p "b_outer id was 70103278585640 before the method and is: 70103278585640 inside the method."
p "c_outer id was 70103278585620 before the method and is: 70103278585620 inside the method."
p "d_outer id was 85 before the method and is: 85 inside the method."
p "-----------------------------------------------------"
p"Again, this one is behaving the same as it was before in Q1."
p "a_outer inside after reassignment is 22 with an id of: 85 before and: 45 after."
p "b_outer inside after reassignment is thirty three with an id of: 70103278585640 before and: 70103278584920 after."
p "c_outer inside after reassignment is [44] with an id of: 70103278585620 before and: 70103278584900 after."
p "d_outer inside after reassignment is 44 with an id of: 85 before and: 89 after."
p "-----------------------------------------------------"
p"With this next one, some objects are getting re-used again."
p "a_inner is 22 with an id of: 45 inside the method (compared to 45 for outer)."
p "b_inner is thirty three with an id of: 70103278584920 inside the method (compared to 70103278584920 for outer)."
p "c_inner is [44] with an id of: 70103278584900 inside the method (compared to 70103278584900 for outer)."
p "d_inner is 44 with an id of: 89 inside the method (compared to 89 for outer)."
p "-----------------------------------------------------"
p "This last one is completely different as values were passed as parameters. The names given to those values in the definition of this method are SEPARATE from any other use of those same names."
p "a_outer is 42 with an id of: 85 BEFORE and: 85 AFTER the method call."
p "b_outer is forty two with an id of: 70103278585640 BEFORE and: 70103278585640 AFTER the method call."
p "c_outer is [42] with an id of: 70103278585620 BEFORE and: 70103278585620 AFTER the method call."
p "d_outer is 42 with an id of: 85 BEFORE and: 85 AFTER the method call."
