#!/usr/bin/env ruby

Y = lambda { |f|
	lambda { |x|
		lambda { |*args| f.call(x.call(x)).call(*args) }
	}.call(lambda { |x|
		lambda { |*args| f.call(x.call(x)).call(*args) }
	})
}

factorial = Y.call(lambda { |f|
   lambda { |n|
	   if n <= 0
		   1
	   else
		   n * f.call(n - 1)
	   end
   }
})

puts factorial.call(ARGV.first.to_i)
