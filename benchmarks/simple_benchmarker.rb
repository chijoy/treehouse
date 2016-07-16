class SimpleBenchmarker
	def run(&block)
		start_time = Time.now
		puts start_time
		block.call
		end_time = Time.now
		puts end_time
		elapsed = end_time - start_time
		puts "\n"
		puts "Elapsed time: #{elapsed} seconds."
	end

	def description_and_run(description, &block)
		start_time = Time.now
		puts start_time
		block.call
		end_time = Time.now
		puts end_time
		elapsed = end_time - start_time
		puts "\n"
		puts "Elapsed time: #{elapsed} seconds."
	end
end

benchmarker = SimpleBenchmarker.new
benchmarker.run do 
	5.times do
		print"."
		sleep(rand(0.1..1.0))
	end
end

# benchmarker.description_and_run do "Run 5 times"
# 	5.times do
# 		print"."
# 		sleep(rand(0.1..1.0))
# 	end
# end