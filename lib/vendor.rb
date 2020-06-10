class Vendor

  attr_reader :name, :inventory
  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory.map do |items, amount|
      if item == items
        amount
      end
    end.reduce
  end

  def stock(item, amount)
    @inventory[item] += amount
  end

  def potential_revenue
    @inventory.map do |item, amount|
      item.price * amount
    end.sum
  end
end
