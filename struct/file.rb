# This will just write to the file, and will be overridden.
# File.open("example.txt", "w") do |file|
# 	print "Enter your name: "
# 	name = gets.chomp
# 	file.puts "Name: #{name}"

# 	print "Enter your email: "
# 	email = gets.chomp
# 	file.puts "Email: #{email}"
# end

# This will add to the file.
File.open("example.txt", "a+") do |file|
	print "Enter your name: "
	name = gets.chomp
	file.puts "Name: #{name}"

	print "Enter your email: "
	email = gets.chomp
	file.puts "Email: #{email}"
end