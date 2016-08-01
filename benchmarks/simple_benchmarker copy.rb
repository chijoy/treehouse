class SimpleBenchmarker
	def run(&block)
		start_time = Time.now
		puts start_time
		block.call
		end_time = Time.now
		puts end_time
		elapsed = end_time - start_time
		puts "Elapsed time: #{elapsed}"
	end
end

benchmarker = SimpleBenchmarker.new
benchmarker.run do 
	100.times { 1000 * 1000 }
end