class BankAccount
	attr_reader :name
	def initialize(name)
		@name = name
		@transations = []
	end

	def add_transaction(description, amount)
		@transactions.push(description: )
	end
end

bank_account = BankAccount.new("Joy")
puts bank_account.inspect