class Customer
	attr_accessor :name

	@@customers = []

	def initialize(options={})
		@name = options[:name]
		add_to_customers
	end

	def self.all
		@@customers
	end

	def self.find_by_name(name)
    	@@customers.find{|customer| customer.name == name}
  	end

	private
	def add_to_customers
    @@customers.each do |customer| 
      if customer.name == @name
        raise DuplicateProductError, "#{name} already exists"
      end
    end
     @@customers<< self
  end

end