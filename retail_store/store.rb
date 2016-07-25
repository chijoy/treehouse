module Inventoryable

	def stock_count
		@stock_count ||= 0
	end

	def stock_count=(number)
		@stock_count = number
end

class Shirt
	include Inventoryable
	attr_accessor :attributes

	def initialize(attributes)
		@attributes = attributes
	end
end

class Pant
	attr_accessor :attributes

	def initialize(attributes)
		@attributes = attributes
	end
end

class Accessory
	attr_accessor :attributes

	def initialize(attributes)
		@attributes = attributes
	end
end

shirt1 = Shirt.new(name: "MTF", size: "L")
shirt2 = Shirt.new(nme: "MTF", size: "M")

