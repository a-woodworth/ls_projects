# Question 3
# Let's call a method, and pass both a string and an array as parameters and see how even though they are treated in the same way by Ruby, the results can be different.

# Study the following code and state what will be displayed...and why:

# def tricky_method(a_string_param, an_array_param)
#   a_string_param += "rutabaga"
#   an_array_param << "rutabaga"
# end

# my_string = "pumpkins"
# my_array = ["pumpkins"]
# tricky_method(my_string, my_array)

# puts "My string looks like this now: #{my_string}"
# puts "My array looks like this now: #{my_array}"

p "My string looks like this now: pumpkins"
p "My array looks like this now: ['pumpkin', 'rutabaga']"

p "Notes to remember on this one: The string operation is re-assignment and CREATES A NEW STRING OBJECT. The reference to this new object is placed in the internal variable of the method, and the method considers this new string object to be the one true string. It has forgotten about the one that was passed in now. That old stale parameter string is still remembered by the caller of the method...but the method itself has forgotten all about it."

p "With the array, one array object can have any number of elements. When we attach an additional element to an array using the << operator, Ruby simply keeps using the same object that was passed in, and appends the new element to it."

p "So, because the method's array variable still points to the original object, the caller's array variable and the method's array variable are still pointing at the same object, and we see the results of what happened to the array 'outside' of the method."
