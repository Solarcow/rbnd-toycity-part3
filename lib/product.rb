class Product
	attr_accessor :title, :price, :stock

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

  def self.find_by_title(title)
    @@products.find{|product| product.title == title}
  end

  def self.in_stock
    stock_array = []
    @@products.each do |product| 
     if product.stock > 0 
      stock_array << product
      end
    end
    p stock_array
  end

  def in_stock?
  	if @stock > 0
  		return true
  	else
  		return false
  	end
  end
  private

  def add_to_products
    @@products.each do |product| 
      if product.title == @title
        raise DuplicateProductError, "#{title} already exists"
      end
    end
     @@products<< self
  end
end











