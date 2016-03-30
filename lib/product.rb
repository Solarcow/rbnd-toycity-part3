class Product
	attr_reader :title

  @@products = []

  def initialize(options={})
  	@title = options[:title]
  	@price = options[:price]
  	@stock = options[:stock]
    add_to_products
  end

  def self.all
    @@products
  end

  def find_by_title
  	@title
  end

  def in_stock?
  	if @stock > 0
  		return true
  	else
  		return false
  	end
  end
  private

  def add_to_products(title)
    # if @title == 
    # 	raise DuplicateProductError, "#{@title} already exists!"
    # else
    @@products << self
  end
end