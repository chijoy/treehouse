require_relative "contact"
require "yaml"

class AddressBook
	attr_reader :contacts

	def initialize
		@contacts = []
		open()
	end

	def open
		if File.exist?("contacts.yml")
			@contacts = YAML.load_file("contacts.yml")
		end
	end 

	def save
		File.open("contacts.yml", "w") do |file|
			file.write(contacts.to_yaml)
		end
	end

	def run
		loop do
			puts "\n"
			puts "Joy's Address Book App:"
			puts "-" * 23
			puts "Enter 'a' to Add contact"
			puts "Enter 'p' to Print address book"
			puts "Enter 's' to Search"
			puts "Enter 'e' to Exit"
			print "Enter your choice now: "
			input = gets.chomp.downcase
			case input
			when "a"
				add_contact
			when "p"
				print_contact_list
			when "s"
				print "Search term: "
				search = gets.chomp
				find_by_name(search)
				find_by_address(search)
				find_by_phone_number(search)
			when "e"
				save()
				break
			end
			puts "\n"
		end
	end

	def add_contact
		contact = Contact.new
		puts "\n"
		print "First name: "
		contact.first_name = gets.chomp
		print "Middle name: "
		contact.middle_name = gets.chomp
		print "Last name: "
		contact.last_name = gets.chomp

		loop do
			puts "\n"
			puts "Add a phone number or an address? "
			puts "Enter 'p' to add a phone number"
			puts "Enter 'a' to add an address"
			puts "Enter 'e' to Exit"
			print "Enter your choice now: "
			response = gets.chomp.downcase
			case response
			when "p"
				phone = PhoneNumber.new
				puts "\n"
				print "Kind (Home, Work, etc.): "
				phone.kind = gets.chomp
				print "Phone number: "
				phone.number = gets.chomp
				contact.phone_numbers.push(phone)
			when "a"
				address = Address.new
				puts "\n"
				print "Kind (Home, Work, etc): "
				address.kind = gets.chomp
				print "Address line 1: "
				address.street_1 = gets.chomp
				print "Address line 2: "
				address.street_2 = gets.chomp
				print "City: "
				address.city = gets.chomp
				print "State: "
				address.state = gets.chomp
				print "Zip Code: "
				address.zip_code = gets.chomp
				contact.addresses.push(address)
			else
				print "\n"
				break
			end
		end

		contacts << contact
	end


	def find_by_name(name)
		results = []
		search = name.downcase
		contacts.each do |contact|
			if contact.full_name.downcase.include?(search)
				results.push(contact) 
				results.push(contact)
			end
		end
		print_results("Search results by name for (#{search})", results)
	end

	def find_by_phone_number(number)
		results = []
		search = number.gsub("-", "")
		contacts.each do |contact|
			contact.phone_numbers.each do |phone_number|
				if phone_number.number.gsub("-", "").include?(search)
					results.push(contact) unless results.include?(contact)
				end
			end
		end
		print_results("Search results by number for (#{search}):", results)
	end

	def find_by_address(query)
		results = []
		search = query.downcase
		contacts.each do |contact|
			contact.addresses.each do |address|
				if address.to_s("long"). downcase.include?(search)
					results.push(contact) unless results.include?(contact)
				end
			end
		end
		print_results("Search results by address for (#{search}):", results)
	end

	def print_contact_list
		puts "\n"
		puts "Contact List:"
		contacts.each do |contact|
			puts contact.to_s("last_first")
		end
	end

	def print_results(search, results)
		puts search
		results.each do |contact|
			puts contact.to_s("full_name")
			contact.print_phone_numbers
			contact.print_addresses
			puts "\n"
		end
	end
end

address_book = AddressBook.new
address_book.run

# address_book.print_contact_list
