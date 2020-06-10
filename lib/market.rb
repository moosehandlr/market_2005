class Market

  attr_reader :name, :vendors
  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.flat_map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    vendors = []
    vendor_items = @vendors.each do |vendor|
      vendor.inventory.each do |itm, amount|
        if itm.name == item.name
          vendors << vendor
        end
      end
    end
    vendors
  end

  def total_inventory
    inventory = {}
    @vendors.each do |vendor|
      vendor.group_by |item|
        item
    end
  end
end
