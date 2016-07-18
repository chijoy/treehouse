require_relative "contact"

class AddressBook
	attr_reader :contacts

	def initialize
		@contacts = []
	end

	def print_contact_list
		puts "Contact List:"
		puts "-" * 22
		contacts.each do |contact|
			puts contact.to_s("last_first")
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


