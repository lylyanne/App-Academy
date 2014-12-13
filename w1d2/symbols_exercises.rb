def super_print(str, options = {})

    str *= options[:times] if options.has_key?(:times)
    str.upcase! if options.has_key?(:upcase)
    str.reverse! if options.has_key?(:reverse)
  str
end

p super_print("Hello")
p super_print("Hello", :times => 3)                       #=> "Hello" 3x
p super_print("Hello", :upcase => true)                   #=> "HELLO"
p super_print("Hello", :upcase => true, :reverse => true) #=> "OLLEH"
p super_print("Hello", :upcase => true, :reverse => true, :times => 2) 

options = {}
p super_print("hello", options)
