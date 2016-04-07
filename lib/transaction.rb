class Transaction
	attr_accessor :customer, :product, :id
	
	@@id = 0
	@@transactions = []
	
	def initialize(customer, product_info, options={})
		@customer = customer
		@product = product_info
		@id = @@id
		@id += 1
		@@transactions << self
		if options[:quantity]
			@product.stock -= options[:quantity]
		else
			@product.stock -= 1
		end
	end
end