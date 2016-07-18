require_relative "contact"

class AddressBook
	attr_reader :contacts

	def initialize
		@contacts = []
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
					results.push(contact)
				end
			end
		end
		print_results("Search results by number for (#{search})", results)
		
	end

	def print_contact_list
		puts "Contact List:"
		puts "-" * 22
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

joy = Contact.new
joy.first_name = "Joy"
joy.middle_name = "Anne"
joy.last_name = "McCaffrey"
joy.add_phone_number("Mobile", "313-456-7890")
joy.add_phone_number("Work", "456-789-0123")
puts joy.add_address("Home", "123 Main Street", " ", "Chicago", "IL", "60657")

address_book.contacts.push(joy)
address_book.print_contact_list
puts
puts
address_book.find_by_name("joy")

puts
puts
address_book.find_by_phone_number("313")



