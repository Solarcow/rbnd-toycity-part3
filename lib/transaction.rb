class Transaction
	attr_accessor :customer, :product, :id
	
	@@id = 0
	@@transactions = []
	
	def initialize(customer, product_info, options={})
		@customer = customer
		@product = product_info
		@id = @@id
		@id += 1
		add_to_transactions
		if options[:quantity]
			@product.stock -= options[:quantity]
		else
			@product.stock -= 1
		end
	end

	def self.all
		@@transactions
	end

	def self.find(location)
		@@transactions.find{|transaction| transaction.id = location}
	end

	private

	def add_to_transactions
		if @product.in_stock? == false
			raise OutOfStockError, "#{product.title} is out of stock"
		end
		@@transactions << self
	end
end